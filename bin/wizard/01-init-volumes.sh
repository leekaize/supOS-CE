#!/bin/bash
# 01-init-volumes.sh - Volume initialization with update detection
# Location: root/bin/wizard/01-init-volumes.sh
# Handles both new installations and updates

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE="$SCRIPT_DIR/../.."

# Load environment and utilities
sed -i 's/\r$//' "$WORKSPACE/.env"
source "$WORKSPACE/.env"
source "$SCRIPT_DIR/../global/log.sh"
source "$SCRIPT_DIR/../util/handle-volumes-path.sh"

VOLUMES_PATH=${VOLUMES_PATH:-/volumes/supos/data}

# --- Detection: New install vs Update ---
if [ -d "$VOLUMES_PATH/postgresql" ]; then
    MODE="update"
    info "Existing installation detected at $VOLUMES_PATH"
    info "Mode: UPDATE (preserving data, refreshing configs)"
else
    MODE="init"
    info "New installation detected"
    info "Mode: INIT (creating fresh structure)"
fi

# --- Create/Verify Directory Structure ---
echo "[VOLUMES] Creating directory structure at $VOLUMES_PATH"

# Core directories
mkdir -p "$VOLUMES_PATH"/{backend,postgresql,keycloak,emqx,kong,nodered,tsdb,konga}

# Backend subdirectories
mkdir -p "$VOLUMES_PATH/backend"/{apps,third-apps,uns,system,log,global-export,excel}

# EMQX subdirectories
mkdir -p "$VOLUMES_PATH/emqx"/{data,log,config}

# PostgreSQL
mkdir -p "$VOLUMES_PATH/postgresql/data"

# Keycloak
mkdir -p "$VOLUMES_PATH/keycloak"/{data,theme}

# Node-RED
mkdir -p "$VOLUMES_PATH/nodered"/{data,offline_modules,themes,override}

# EventFlow
mkdir -p "$VOLUMES_PATH/eventflow"

# Kong
mkdir -p "$VOLUMES_PATH/kong"/{declarative,logs}

# TSDB
mkdir -p "$VOLUMES_PATH/tsdb/data"

# Konga
mkdir -p "$VOLUMES_PATH/konga/db"

# Optional app directories
mkdir -p "$VOLUMES_PATH"/{grafana/data/plugins,minio,portainer,chat2db,filebeat,fuxa/appdata,plugins/package}

echo "[VOLUMES] ✓ Directory structure verified"

# --- NPM Cache Extraction ---
if [ "$MODE" = "init" ] || [ ! -d "$VOLUMES_PATH/nodered/.npm" ]; then
    info "Extracting npm cache for Node-RED..."
    tar -xf "$WORKSPACE/mount/node-red/npmCache.tar.xz" -C "$WORKSPACE/mount/node-red/" > /dev/null 2>&1
    info "Extracting npm cache for EventFlow..."
    tar -xf "$WORKSPACE/mount/node-red/npmCache.tar.xz" -C "$WORKSPACE/mount/eventflow/" > /dev/null 2>&1
    info "✓ NPM cache extracted"
fi

# --- Grafana Plugins ---
info "Extracting Grafana plugins..."
find "$WORKSPACE/mount/grafana/data/plugins/" -type f -name "*.tar.gz" -exec tar -xzf {} -C "$WORKSPACE/mount/grafana/data/plugins/" \; 2>/dev/null

# --- Mode-Specific Operations ---
if [ "$MODE" = "init" ]; then
    # NEW INSTALLATION: Full copy
    info "Copying mount files to volumes..."
    cp -r "$WORKSPACE/mount"/* "$VOLUMES_PATH/"
    
    # PostgreSQL ownership/permissions
    chown 999:0 -R "$VOLUMES_PATH/postgresql"
    chmod 644 "$VOLUMES_PATH/postgresql/conf"/*.conf 2>/dev/null || true
    
else
    # UPDATE: Selective refresh (preserve user data)
    info "Updating configuration files..."
    
    # Grafana plugins
    cp -r "$WORKSPACE/mount/grafana/data/plugins"/* "$VOLUMES_PATH/grafana/data/plugins/"
    
    # Keycloak theme
    cp -r "$WORKSPACE/mount/keycloak/theme"/* "$VOLUMES_PATH/keycloak/theme/"
    
    # Kong configs
    cp -r "$WORKSPACE/mount/kong"/* "$VOLUMES_PATH/kong/"
    
    # EMQX configs
    cp "$WORKSPACE/mount/emqx/config"/* "$VOLUMES_PATH/emqx/config/"
    
    # Node-RED updates
    rm -rf "$VOLUMES_PATH/nodered/.npm"
    cp -r "$WORKSPACE/mount/node-red/.npm" "$VOLUMES_PATH/nodered/"
    cp -r "$WORKSPACE/mount/node-red/offline_modules"/* "$VOLUMES_PATH/nodered/offline_modules/"
    cp -r "$WORKSPACE/mount/node-red/themes"/* "$VOLUMES_PATH/nodered/themes/"
    cp -r "$WORKSPACE/mount/node-red/override"/* "$VOLUMES_PATH/nodered/override/"
    cp -r "$WORKSPACE/mount/node-red/template" "$VOLUMES_PATH/nodered/"
    
    # EventFlow
    cp -r "$WORKSPACE/mount/eventflow"/* "$VOLUMES_PATH/eventflow/"
    
    # Filebeat
    cp -r "$WORKSPACE/mount/filebeat"/*.yml "$VOLUMES_PATH/filebeat/"
    
    # PostgreSQL (configs only, not data)
    cp -r "$WORKSPACE/mount/postgresql/conf" "$VOLUMES_PATH/postgresql/" 2>/dev/null || true
    cp -r "$WORKSPACE/mount/postgresql/init-scripts" "$VOLUMES_PATH/postgresql/" 2>/dev/null || true
    
    # Backend configs
    cp -r "$WORKSPACE/mount/backend"/* "$VOLUMES_PATH/backend/"
    
    # FUXA
    cp "$WORKSPACE/mount/fuxa/appdata/settings.js" "$VOLUMES_PATH/fuxa/appdata/"
    
    # Plugins
    cp "$WORKSPACE/mount/plugins/package"/*.tar.gz "$VOLUMES_PATH/plugins/package/" 2>/dev/null || true
fi

# --- Common Post-Processing ---

# EMQX config initialization
if [ ! -f "$VOLUMES_PATH/emqx/config/emqx.conf" ]; then
    echo "node.name = emqx@127.0.0.1" > "$VOLUMES_PATH/emqx/config/emqx.conf"
    info "✓ Created emqx.conf"
fi

if [ ! -f "$VOLUMES_PATH/emqx/config/acl.conf" ]; then
    echo "{allow, all}." > "$VOLUMES_PATH/emqx/config/acl.conf"
    info "✓ Created acl.conf"
fi

if [ ! -f "$VOLUMES_PATH/emqx/config/default_api_key.conf" ]; then
    touch "$VOLUMES_PATH/emqx/config/default_api_key.conf"
    info "✓ Created default_api_key.conf"
fi

# Copy docker-compose and builds.yaml to backend/system
cp "$WORKSPACE/docker-compose-8c16g.yml" "$VOLUMES_PATH/backend/system/"
cp "$WORKSPACE/builds.yaml" "$VOLUMES_PATH/backend/system/"

# Set ownership for service users
chown 999:0 -R "$VOLUMES_PATH/postgresql" 2>/dev/null || true
chown 1000:1000 -R "$VOLUMES_PATH/emqx" 2>/dev/null || true
chown 1000:0 -R "$VOLUMES_PATH/keycloak" 2>/dev/null || true
chown 755:0 -R "$VOLUMES_PATH/grafana" 2>/dev/null || true

# Make all shell scripts executable
find "$VOLUMES_PATH" -name "*.sh" -exec chmod +x {} \;

# Set base permissions
chmod -R 755 "$VOLUMES_PATH"

echo ""
info "============================================"
info "Volume initialization complete: $MODE"
info "Path: $VOLUMES_PATH"
info "============================================"