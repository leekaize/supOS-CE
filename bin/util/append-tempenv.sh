#!/bin/bash

commands=$1

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd)"

ENV_TMP=$ROOT_DIR/../../.env.tmp

source $ROOT_DIR/../../.env

# Setting the .env.tmp temporary environment variable
if [ "$LANGUAGE" == "zh-CN" ]; then
  echo "GRAFANA_LANG=zh-Hans" > $ENV_TMP
  echo "FUXA_LANG=zh-cn" >> $ENV_TMP
else
  echo "GRAFANA_LANG=en-US" > $ENV_TMP
  echo "FUXA_LANG=en" >> $ENV_TMP
fi

# Determine if ELK is enabled
if echo "$commands" | grep -q "elk"; then
   echo "ENABLE_ELK=true" >> $ENV_TMP
   echo "ENABLE_ELK_MENU=menu" >> $ENV_TMP
else
   echo "ENABLE_ELK=false" >> $ENV_TMP
   echo "ENABLE_ELK_MENU=none" >> $ENV_TMP
fi

# Determine if gitea is enabled
if echo "$commands" | grep -q "gitea"; then
   echo "ENABLE_GITEA_MENU=menu" >> $ENV_TMP
else
   echo "ENABLE_GITEA_MENU=none" >> $ENV_TMP
fi

# Determine if MCP-Client is enabled
if echo "$commands" | grep -q "mcpclient"; then
   echo "ENABLE_MCP_MENU=menu" >> $ENV_TMP
else
   echo "ENABLE_MCP_MENU=none" >> $ENV_TMP
fi

# ---------------------------------------------------------------------------
# 3. Toggle optional stacks based on OS_RESOURCE_SPEC
# ---------------------------------------------------------------------------
# if [[ "${OS_RESOURCE_SPEC:-0}" == "1" ]]; then
#   echo "ENABLE_PORTAINER_MENU=none" >> $ENV_TMP
# else
#   echo "ENABLE_PORTAINER_MENU=menu" >> $ENV_TMP
# fi

echo "ENABLE_PORTAINER_MENU=menu" >> $ENV_TMP
