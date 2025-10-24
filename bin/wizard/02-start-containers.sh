#!/bin/bash
# 02-start-containers.sh - Configure and start Docker Compose services
# Location: root/bin/wizard/02-start-containers.sh
# Args: $1 = comma-separated profile list (e.g., "grafana,minio")

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE="$SCRIPT_DIR/../.."

# --- 1. Environment Loading ---
if [ ! -f "$WORKSPACE/.env" ]; then
    echo "[ERROR] .env file not found at $WORKSPACE/.env"
    exit 1
fi

sed -i 's/\r$//' "$WORKSPACE/.env"
source "$WORKSPACE/.env"
source "$SCRIPT_DIR/../global/log.sh"

info "Starting container configuration..."

# --- 2. Generate Keycloak Database Init SQL ---
info "Generating Keycloak SQL configuration..."

KEYCLOAK_BASE_URL="$ENTRANCE_PROTOCOL://$ENTRANCE_DOMAIN:$ENTRANCE_PORT"
KEYCLOAK_BASE_URL_13020="$ENTRANCE_PROTOCOL://$ENTRANCE_DOMAIN"

if [[ "$ENTRANCE_PORT" == "80" || "$ENTRANCE_PORT" == "443" ]]; then
    KEYCLOAK_BASE_URL="$ENTRANCE_PROTOCOL://$ENTRANCE_DOMAIN"
fi

KEYCLOAK_TPL_FILE="$WORKSPACE/mount/postgresql/init-scripts/create_keycloak_database.sql.tpl"
KEYCLOAK_OUTPUT_FILE="$WORKSPACE/mount/postgresql/init-scripts/create_keycloak_database.sql"

if [ -f "$KEYCLOAK_TPL_FILE" ]; then
    rm -f "$KEYCLOAK_OUTPUT_FILE"
    cp "$KEYCLOAK_TPL_FILE" "$KEYCLOAK_OUTPUT_FILE"
    sed -i "s|KEYCLOAK_BASE_URL_13020_VAR|$KEYCLOAK_BASE_URL_13020|g" "$KEYCLOAK_OUTPUT_FILE"
    sed -i "s|KEYCLOAK_BASE_URL_VAR|$KEYCLOAK_BASE_URL|g" "$KEYCLOAK_OUTPUT_FILE"
    sed -i "s|LANGUAGE_VAR|${LANGUAGE:-en}|g" "$KEYCLOAK_OUTPUT_FILE"
    info "✓ Keycloak SQL generated"
else
    warn "Keycloak template not found, skipping SQL generation"
fi

# --- 3. Select Profiles & Set ENABLE Flags ---
info "Processing service profiles..."

# Source profile selection functions
source "$SCRIPT_DIR/../global/choose-profile-command.sh"

# Source profile selection script if exists
if [ -f "$SCRIPT_DIR/../util/select-service-profile.sh" ]; then
    source "$SCRIPT_DIR/../util/select-service-profile.sh"
fi

# Build profile list from args and environment
SELECTED_PROFILES=()
if [ -n "$1" ]; then
    IFS=',' read -ra CLI_PROFILES <<< "$1"
    SELECTED_PROFILES+=("${CLI_PROFILES[@]}")
fi
if [ -n "${COMPOSE_PROFILE_ARGS[*]}" ]; then
    for arg in "${COMPOSE_PROFILE_ARGS[@]}"; do
        if [[ "$arg" == "--profile" ]]; then continue; fi
        SELECTED_PROFILES+=("$arg")
    done
fi

# Set ENABLE_* flags based on selected profiles
# Original pattern: "menu" when enabled, "none" when disabled
export ENABLE_GRAFANA="none"
export ENABLE_MINIO="none"
export ENABLE_ELK_MENU="none"
export ENABLE_MCP="none"
export ENABLE_PORTAINER="menu"

for profile in "${SELECTED_PROFILES[@]}"; do
    case "$profile" in
        grafana) export ENABLE_GRAFANA="menu" ;;
        minio) export ENABLE_MINIO="menu" ;;
        elk) export ENABLE_ELK_MENU="menu" ;;
        mcpclient) export ENABLE_MCP="menu" ;;
        portainer) export ENABLE_PORTAINER="menu" ;;
    esac
done

info "Profile flags: GRAFANA=$ENABLE_GRAFANA MINIO=$ENABLE_MINIO ELK=$ENABLE_ELK_MENU MCP=$ENABLE_MCP PORTAINER=$ENABLE_PORTAINER"

# --- 4. Generate Kong Configuration (AFTER flags set) ---
info "Generating Kong configuration..."

# Build redirect URL
REDIRECT_BASE_URL="$ENTRANCE_PROTOCOL://$ENTRANCE_DOMAIN:$ENTRANCE_PORT"
if [[ "$ENTRANCE_PORT" == "80" || "$ENTRANCE_PORT" == "443" ]]; then
    REDIRECT_BASE_URL="$ENTRANCE_PROTOCOL://$ENTRANCE_DOMAIN"
fi
export BASE_URL="$REDIRECT_BASE_URL"

# Set Kong auth flag
OS_AUTH_ENABLE=${OS_AUTH_ENABLE:-true}
if [[ "${OS_AUTH_ENABLE,,}" == "true" ]]; then
    export KONG_AUTH_ENABLED=true
else
    export KONG_AUTH_ENABLED=false
fi

# --- 5. Create Temporary Environment File ---
cat > "$WORKSPACE/.env.tmp" << EOF
# Runtime configuration generated $(date)
BASE_URL=$BASE_URL
KONG_AUTH_ENABLED=$KONG_AUTH_ENABLED
ENABLE_GRAFANA=$ENABLE_GRAFANA
ENABLE_MINIO=$ENABLE_MINIO
ENABLE_ELK_MENU=$ENABLE_ELK_MENU
ENABLE_MCP=$ENABLE_MCP
ENABLE_PORTAINER=$ENABLE_PORTAINER
EOF

# Export .env.tmp vars for envsubst (CRITICAL - original pattern)
# Export base .env FIRST
export $(grep -v '^#' "$WORKSPACE/.env" | xargs)

# Then export .env.tmp overrides
if [[ -f "$WORKSPACE/.env.tmp" ]]; then
    export $(grep -v '^#' "$WORKSPACE/.env.tmp" | xargs)
fi

info "✓ Environment exported for template rendering"

# NOW render Kong config with exported vars
KONG_TEMPLATE="$WORKSPACE/mount/kong/kong_config.yml.tpl"
KONG_OUTPUT="$WORKSPACE/mount/kong/kong_config.yml"

if [ -f "$KONG_TEMPLATE" ]; then
    rm -f "$KONG_OUTPUT"
    envsubst < "$KONG_TEMPLATE" > "$KONG_OUTPUT"
    info "✓ Kong config generated (auth=$KONG_AUTH_ENABLED)"
else
    warn "Kong template not found, skipping config generation"
fi

# --- 6. Select Docker Compose File ---
COMPOSE_FILE="$WORKSPACE/docker-compose-4c8g.yml"
if [ "$OS_RESOURCE_SPEC" == "2" ]; then
    COMPOSE_FILE="$WORKSPACE/docker-compose-8c16g.yml"
fi

if [ ! -f "$COMPOSE_FILE" ]; then
    error "Compose file not found: $COMPOSE_FILE"
    exit 1
fi

echo "[CONTAINERS] Using: $COMPOSE_FILE"
echo "[CONTAINERS] Spec: ${OS_RESOURCE_SPEC:-1} (1=4c8g, 2=8c16g)"

# --- 7. Build Profile Arguments ---
PROFILE_ARGS=()

# From command line argument
if [ -n "$1" ]; then
    IFS=',' read -ra PROFILES <<< "$1"
    for profile in "${PROFILES[@]}"; do
        PROFILE_ARGS+=("--profile" "$profile")
        echo "[CONTAINERS] Profile: $profile"
    done
fi

# From COMPOSE_PROFILE_ARGS if set
if [ -n "${COMPOSE_PROFILE_ARGS[*]}" ]; then
    PROFILE_ARGS+=("${COMPOSE_PROFILE_ARGS[@]}")
fi

# --- 8. Load Docker Images (if available) ---
if [ -d "$WORKSPACE/images/" ] && [ "$(ls -A "$WORKSPACE/images/")" ]; then
    info "Loading Docker images from $WORKSPACE/images/..."
    for tar_file in "$WORKSPACE/images"/*.tar; do
        if [ -f "$tar_file" ]; then
            docker load -i "$tar_file"
        fi
    done
    info "✓ Images loaded"
fi

# --- 9. Start Containers ---
info "Starting Docker containers..."
echo "[CONTAINERS] Command: docker compose --env-file .env --env-file .env.tmp --project-name supos ${PROFILE_ARGS[*]} -f $COMPOSE_FILE up -d"

if ! docker compose \
    --env-file "$WORKSPACE/.env" \
    --env-file "$WORKSPACE/.env.tmp" \
    --project-name supos \
    "${PROFILE_ARGS[@]}" \
    -f "$COMPOSE_FILE" \
    up -d; then
    error "Failed to start Docker containers"
    echo "[ERROR] Check logs with: docker compose logs"
    exit 1
fi

echo ""
info "============================================"
info "✓ Services started successfully"
info "============================================"
echo ""
info "Waiting for services to become healthy..."
echo "Run 'docker ps' to verify container status"