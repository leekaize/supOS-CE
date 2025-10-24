#!/bin/bash
# 03-validate-keycloak.sh - Wait for Keycloak readiness
# Location: root/bin/wizard/03-validate-keycloak.sh
# Does NOT create users (no curl available in container)
# User creation happens via orchestrator API

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE="$SCRIPT_DIR/../.."

# Load environment
if [ -f "$WORKSPACE/.env" ]; then
    source "$WORKSPACE/.env"
    source "$SCRIPT_DIR/../global/log.sh"
else
    echo "[ERROR] .env not found at $WORKSPACE/.env"
    exit 1
fi

info "Validating Keycloak readiness..."

# --- 1. Wait for Container Health ---
MAX_WAIT=180
ELAPSED=0

while [ $ELAPSED -lt $MAX_WAIT ]; do
    HEALTH_STATUS=$(docker inspect --format='{{.State.Health.Status}}' keycloak 2>/dev/null || echo "none")
    
    if [ "$HEALTH_STATUS" = "healthy" ]; then
        info "✓ Keycloak container healthy (${ELAPSED}s)"
        break
    fi
    
    # Progress every 30s
    if [ $((ELAPSED % 30)) -eq 0 ] && [ $ELAPSED -gt 0 ]; then
        info "Status: $HEALTH_STATUS (${ELAPSED}s elapsed)"
    fi
    
    sleep 5
    ELAPSED=$((ELAPSED + 5))
done

if [ $ELAPSED -ge $MAX_WAIT ]; then
    error "Keycloak not healthy after ${MAX_WAIT}s"
    echo ""
    echo "Container status:"
    docker inspect keycloak --format='Health: {{.State.Health.Status}}' 2>&1 || true
    echo ""
    echo "Recent logs:"
    docker logs --tail 30 keycloak 2>&1 || true
    exit 1
fi

# --- 2. Grace Period ---
info "Grace period: waiting 30s for full initialization..."
sleep 30

# --- 3. Verify Listening ---
info "Verifying Keycloak is listening on port 8080..."
if docker exec keycloak timeout 5 bash -c "exec 3<>/dev/tcp/localhost/8080" 2>/dev/null; then
    info "✓ Keycloak port 8080 responding"
else
    warn "Port check failed, but container is healthy - proceeding"
fi

echo ""
info "============================================"
info "Keycloak validation complete"
info "Note: User creation handled by orchestrator"
info "============================================"