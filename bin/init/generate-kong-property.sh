#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# init‑kong.sh – Generate mount/kong/kong_config.yml from .env/.env.tmp
# ---------------------------------------------------------------------------
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ---------------------------------------------------------------------------
# 0. Normalise .env line endings (Windows → Unix)
# ---------------------------------------------------------------------------
sed -i 's/\r$//' "$SCRIPT_DIR/../../.env"

# ---------------------------------------------------------------------------
# 1. Load variables from .env
# ---------------------------------------------------------------------------
export $(grep -v '^#' "$SCRIPT_DIR/../../.env"      | xargs)

# ---------------------------------------------------------------------------
# 2. Build BASE_URL
# ---------------------------------------------------------------------------
REDIRECT_BASE_URL="$ENTRANCE_PROTOCOL://$ENTRANCE_DOMAIN:$ENTRANCE_PORT"
if [[ "$ENTRANCE_PORT" == "80" || "$ENTRANCE_PORT" == "443" ]]; then
  REDIRECT_BASE_URL="$ENTRANCE_PROTOCOL://$ENTRANCE_DOMAIN"
fi
export BASE_URL="$REDIRECT_BASE_URL"

# ---------------------------------------------------------------------------
# 3. Toggle optional stacks based on OS_RESOURCE_SPEC
# ---------------------------------------------------------------------------
if [[ "${OS_RESOURCE_SPEC:-0}" == "1" ]]; then
  export ENABLE_ELK=none
  export ENABLE_PORTAINER=none
  export ENABLE_MCP=none
else
  export ENABLE_ELK=menu
  export ENABLE_PORTAINER=menu
  export ENABLE_MCP=menu
fi

# ---------------------------------------------------------------------------
# 4. Authentication flag → KONG_AUTH_ENABLED
#    (default to true if missing)
# ---------------------------------------------------------------------------
OS_AUTH_ENABLE=${OS_AUTH_ENABLE:-true}

if [[ "${OS_AUTH_ENABLE,,}" == "true" ]]; then
  export KONG_AUTH_ENABLED=true
else
  export KONG_AUTH_ENABLED=false
fi

# ---------------------------------------------------------------------------
# 5. Load .env.tmp overrides (if the file exists)
# ---------------------------------------------------------------------------
if [[ -f "$SCRIPT_DIR/../../.env.tmp" ]]; then
  export $(grep -v '^#' "$SCRIPT_DIR/../../.env.tmp" | xargs)
fi

# ---------------------------------------------------------------------------
# 6. Render Kong configuration
# ---------------------------------------------------------------------------
TEMPLATE_FILE="$SCRIPT_DIR/../../mount/kong/kong_config.yml.tpl"
OUTPUT_FILE="$SCRIPT_DIR/../../mount/kong/kong_config.yml"

rm -f "$OUTPUT_FILE"
envsubst < "$TEMPLATE_FILE" > "$OUTPUT_FILE"

echo "Info: success to generate kong_config.yml (auth enabled = $KONG_AUTH_ENABLED)"
