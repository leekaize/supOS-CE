#!/bin/bash

set -e

if [ -z "${VOLUMES_PATH}" ]; then
  warn "VOLUMES_PATH环境变量不存在, 设置默认volume：/volumes/supos/data"
  VOLUMES_PATH=/volumes/supos/data
fi
# load npm cache
tar -xf $SCRIPT_DIR/../mount/node-red/npmCache.tar.xz -C $SCRIPT_DIR/../mount/node-red/ > /dev/null 2>&1
tar -xf $SCRIPT_DIR/../mount/node-red/npmCache.tar.xz -C $SCRIPT_DIR/../mount/eventflow/ > /dev/null 2>&1

info "loading npm cache complete."
find $SCRIPT_DIR/../mount/grafana/data/plugins/ -type f -name "*.tar.gz" -exec tar -xzvf {} -C $SCRIPT_DIR/../mount/grafana/data/plugins/ \;

# 创建volumes目录
mkdir -p $VOLUMES_PATH && cp -r $SCRIPT_DIR/../mount/* $VOLUMES_PATH
chown 999:0 -R $VOLUMES_PATH/postgresql
chmod 644 $VOLUMES_PATH/postgresql/conf/*.conf
chown 1000:1000 -R $VOLUMES_PATH/emqx
chown 1000:0 -R $VOLUMES_PATH/keycloak
chown 755:0 -R $VOLUMES_PATH/grafana

cp $SCRIPT_DIR/../docker-compose-8c16g.yml $VOLUMES_PATH/backend/system/
if [ -f $SCRIPT_DIR/global/active-services.txt ]; then 
  mv $SCRIPT_DIR/global/active-services.txt $VOLUMES_PATH/backend/system/
fi
# 设置.sh文件为可执行文件
find $VOLUMES_PATH -name "*.sh" -exec chmod +x {} \;

info "success to create folder: $VOLUMES_PATH"