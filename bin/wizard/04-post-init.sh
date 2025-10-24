#!/bin/bash
# 04-post-init.sh - Post-startup service initialization
# Location: root/bin/wizard/04-post-init.sh
# Runs after containers are up and healthy

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE="$SCRIPT_DIR/../.."

# Load environment
source "$WORKSPACE/.env"
source "$SCRIPT_DIR/../global/log.sh"

info "Starting post-initialization..."

# --- 1. Copy Active Services Configuration ---
SOURCE_CONFIG="$SCRIPT_DIR/../global/active-services.txt"
FINAL_CONFIG="$VOLUMES_PATH/backend/system/active-services.txt"

if [ -f "$SOURCE_CONFIG" ]; then
    info "Activating service profile..."
    mkdir -p "$(dirname "$FINAL_CONFIG")"
    cp "$SOURCE_CONFIG" "$FINAL_CONFIG"
    info "✓ Service profile activated"
fi

# --- 2. Wait for Core Services ---
info "Waiting for core services to stabilize..."
sleep 10

# --- 3. Node-RED Initialization ---
if docker ps --format '{{.Names}}' | grep -q "^nodered$"; then
    info "Initializing Node-RED..."
    
    # Wait for port
    MAX_WAIT=30
    ELAPSED=0
    while [ $ELAPSED -lt $MAX_WAIT ]; do
        if lsof -i :1880 > /dev/null 2>&1; then
            break
        fi
        sleep 5
        ELAPSED=$((ELAPSED + 5))
    done
    
    if [ -f "$SCRIPT_DIR/../init/init-nodered.sh" ]; then
        source "$SCRIPT_DIR/../init/init-nodered.sh" && info "✓ Node-RED initialized" \
        || warn "Node-RED init failed"
    fi
    
    # Hide protocol nodes
    if [ -f "$SCRIPT_DIR/../init/hide-nodered.sh" ]; then
        source "$SCRIPT_DIR/../init/hide-nodered.sh" && info "✓ Node-RED protocols configured" \
        || warn "Node-RED protocol config failed"
    fi
else
    info "Node-RED not running, skipping initialization"
fi

# --- 4. EventFlow Initialization ---
if docker ps --format '{{.Names}}' | grep -q "^eventflow$"; then
    info "Initializing EventFlow..."
    
    # Wait for port
    MAX_WAIT=30
    ELAPSED=0
    while [ $ELAPSED -lt $MAX_WAIT ]; do
        if lsof -i :1889 > /dev/null 2>&1; then
            break
        fi
        sleep 5
        ELAPSED=$((ELAPSED + 5))
    done
    
    if [ -f "$SCRIPT_DIR/../init/init-eventflow.sh" ]; then
        source "$SCRIPT_DIR/../init/init-eventflow.sh" && info "✓ EventFlow initialized" \
        || warn "EventFlow init failed"
    fi
else
    info "EventFlow not running, skipping initialization"
fi

# --- 5. MinIO Initialization ---
if docker ps --format '{{.Names}}' | grep -q "^minio$"; then
    info "Initializing MinIO..."
    
    if [ -f "$SCRIPT_DIR/../init/init-minio.sh" ]; then
        source "$SCRIPT_DIR/../init/init-minio.sh" "$1" > /dev/null 2>&1 \
        && info "✓ MinIO initialized" \
        || warn "MinIO init failed"
    fi
else
    info "MinIO not running, skipping initialization"
fi

# --- 6. Portainer Initialization ---
if docker ps --format '{{.Names}}' | grep -q "^portainer$"; then
    info "Initializing Portainer..."
    
    if [ -f "$SCRIPT_DIR/../init/init-portainer.sh" ]; then
        source "$SCRIPT_DIR/../init/init-portainer.sh" "$1" && info "✓ Portainer initialized" \
        || warn "Portainer init failed"
    fi
else
    info "Portainer not running, skipping initialization"
fi

# --- 7. Gitea Initialization (Optional) ---
if docker ps --format '{{.Names}}' | grep -q "^gitea$"; then
    info "Initializing Gitea..."
    
    if [ -f "$SCRIPT_DIR/../init/gitea-init.sh" ]; then
        source "$SCRIPT_DIR/../init/gitea-init.sh" "$1" && info "✓ Gitea initialized" \
        || warn "Gitea init failed"
    fi
    
    # Gitea Runner
    if [ -f "$SCRIPT_DIR/../init/gitea-runner-init.sh" ]; then
        source "$SCRIPT_DIR/../init/gitea-runner-init.sh" && info "✓ Gitea Runner initialized" \
        || warn "Gitea Runner init failed"
    fi
else
    info "Gitea not running, skipping initialization"
fi

# --- 8. Success Banner ---
echo ""
echo "============================================================"
echo "🎉  All services are up and running!"
echo "👉  Open the platform in your browser:"
echo ""

# Build platform URL
if [[ "$ENTRANCE_PORT" == "80" || "$ENTRANCE_PORT" == "443" ]]; then
    PLATFORM_URL="${ENTRANCE_PROTOCOL}://${ENTRANCE_DOMAIN}/home"
else
    PLATFORM_URL="${ENTRANCE_PROTOCOL}://${ENTRANCE_DOMAIN}:${ENTRANCE_PORT}/home"
fi

echo "      $PLATFORM_URL"
echo ""
echo "    Default credentials:"
echo "    Username: supos"
echo "    Password: supos"
echo ""
echo "============================================================"
echo ""

# --- 9. Service Status Summary ---
info "Service Status:"
docker ps --format "table {{.Names}}\t{{.Status}}" | grep -E "NAME|supos-"

echo ""
info "To view logs: docker compose logs -f [service-name]"
info "To stop: docker compose down"
echo ""
info "Post-initialization complete"