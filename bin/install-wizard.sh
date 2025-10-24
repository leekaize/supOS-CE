#!/bin/bash
# install-wizard.sh - Non-interactive installation for orchestrator
# All configuration via environment variables

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/global/log.sh"

info "$SCRIPT_DIR"

info "Starting automated installation..."

# Load .env
if [ -f "$SCRIPT_DIR/../.env" ]; then
    sed -i 's/\r$//' "$SCRIPT_DIR/../.env"
    source "$SCRIPT_DIR/../.env"
else
    error ".env file not found"
    exit 1
fi

# Validate required env vars
: "${ENTRANCE_DOMAIN:?ENTRANCE_DOMAIN not set}"
: "${VOLUMES_PATH:?VOLUMES_PATH not set}"
: "${OS_RESOURCE_SPEC:=1}"

info "Configuration:"
info "  Domain: $ENTRANCE_DOMAIN"
info "  Volumes: $VOLUMES_PATH"
info "  Spec: ${OS_RESOURCE_SPEC} (1=4c8g, 2=8c16g)"

# Select compose file
DOCKER_COMPOSE_FILE="$SCRIPT_DIR/../docker-compose-8c16g.yml"
if [ "$OS_RESOURCE_SPEC" == "1" ]; then
  DOCKER_COMPOSE_FILE="$SCRIPT_DIR/../docker-compose-4c8g.yml"
fi

# Initialize volumes
if [ -d "$VOLUMES_PATH/postgresql" ]; then
  info "Existing installation detected - updating volumes..."
  source "$SCRIPT_DIR/stop.sh"
  source "$SCRIPT_DIR/init/update-volumes.sh"
else
  info "New installation - initializing volumes..."
  source "$SCRIPT_DIR/init/init-volumes.sh"
fi

# Read profile command from active-services.txt (pre-written by orchestrator)
PROFILE_COMMAND=""
ACTIVE_SERVICES_FILE="$VOLUMES_PATH/backend/system/active-services.txt"
if [ -f "$ACTIVE_SERVICES_FILE" ]; then
    PROFILE_COMMAND=$(sed -n '2p' "$ACTIVE_SERVICES_FILE")
    info "Using profile: $PROFILE_COMMAND"
fi

# Convert profile command to array
declare -a COMPOSE_PROFILE_ARGS=($PROFILE_COMMAND)

# Pre-run initialization
source "$SCRIPT_DIR/util/set-temp-env.sh" "$SCRIPT_DIR/../" "${COMPOSE_PROFILE_ARGS[@]}"
source "$SCRIPT_DIR/init/init-keycloak-sql.sh" "$SCRIPT_DIR/.."
source "$SCRIPT_DIR/init/init-kong-property.sh" "$SCRIPT_DIR/.."

# Copy active services config
if [ -f "$SCRIPT_DIR/global/active-services.txt" ]; then
    mkdir -p "$(dirname "$ACTIVE_SERVICES_FILE")"
    cp "$SCRIPT_DIR/global/active-services.txt" "$ACTIVE_SERVICES_FILE"
fi

# Load pre-built images if available
if [ -d "$SCRIPT_DIR/../images/" ] && [ "$(ls -A "$SCRIPT_DIR/../images/")" ]; then
  source "$SCRIPT_DIR/util/load-images.sh"
fi

# Start services
info "Starting Docker containers..."
if ! docker compose --env-file "$SCRIPT_DIR/../.env" --env-file "$SCRIPT_DIR/../.env.tmp" --project-name supos "${COMPOSE_PROFILE_ARGS[@]}" -f "$DOCKER_COMPOSE_FILE" up -d; then
    error "Failed to start containers"
    exit 1
fi

info "Containers started - waiting for health checks..."

# Post-init scripts
source "$SCRIPT_DIR/init/init-nodered.sh"
source "$SCRIPT_DIR/init/init-eventflow.sh"
source "$SCRIPT_DIR/init/hide-nodered.sh"
source "$SCRIPT_DIR/init/init-minio.sh" "$1" > /dev/null 2>&1 || true
source "$SCRIPT_DIR/init/init-portainer.sh" || true

info "Installation complete!"