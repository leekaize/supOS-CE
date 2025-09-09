#!/bin/bash

set -e

times=5
NODERED_SERVICE=$1
NODERED_PORT=$2

info "start to init nodered modules ..."

while (( times > 0 )); do
    # 检查端口是否开启
    if lsof -i :$NODERED_PORT > /dev/null 2>&1; then
        break  # 端口开启后退出循环
    else
        (( times-- ))
        sleep 5  # 等待5秒后重试
    fi
done


# --verbose
docker exec $NODERED_SERVICE sh -c "cd /data && npm install --no-audit --offline @supcon-international/node-red-dev-copilot@1.7.5" \
|| error "node-red install node-red-dev-copilot failed!"

#docker exec $NODERED_SERVICE sh -c "cd /data && npm install --no-audit --offline @flowfuse/node-red-dashboard@1.26.0" \
#|| error "node-red install node-red-dashboard failed!"

docker exec $NODERED_SERVICE sh -c "cd /data && npm install --no-audit --offline factory-agent-actions@1.1.0" \
|| error "node-red install factory-agent-actions failed!"

docker exec $NODERED_SERVICE sh -c "cd /data && npm install --no-audit --offline factory-agent-deepseek@1.1.1" \
|| error "node-red install factory-agent-deepseek failed!"

docker exec $NODERED_SERVICE sh -c "cd /data && npm install --no-audit --offline factory-agent-gemini@1.0.6" \
|| error "node-red install factory-agent-gemini failed!"

docker exec $NODERED_SERVICE sh -c "cd /data && npm install  --no-audit --offline factory-agent-states@1.1.8" \
|| error "node-red install factory-agent-states failed!"


docker exec $NODERED_SERVICE sh -c "cd /data && npm install  --no-audit --offline node-red-contrib-modbus@5.43.0" \
|| error "node-red install modbus failed!"

docker exec $NODERED_SERVICE sh -c "cd /data && npm install --no-audit --offline node-red-contrib-opcua@0.2.339" \
|| error "node-red install opcua failed!"

docker exec $NODERED_SERVICE sh -c "cd /data && npm install --no-audit --offline node-red-contrib-opcda-client@0.0.7" \
|| error "node-red install opcda failed!"

docker exec $NODERED_SERVICE sh -c "cd /data && npm install  --no-audit --offline node-red-contrib-buffer-parser@3.2.2" \
|| error "node-red install buffer-parser failed!"

# license: GPL-3.0-or-later 默认不安装，用户可以自主安装
#docker exec $2 sh -c "cd /data && npm install $3 --no-audit --offline node-red-contrib-s7@3.1.0" \
#|| error "node-red install Siemens s7 failed!"
#
#docker exec $NODERED_SERVICE sh -c "cd /data && npm install --no-audit --offline node-red-contrib-mcprotocol@1.2.1" \
#|| error "node-red install MITSUBISHI mcprotocol failed!"
#
#docker exec $NODERED_SERVICE sh -c "cd /data && npm install --no-audit --offline node-red-contrib-omron-fins@0.5.0" \
#|| error "node-red install OMRON fins failed!"

docker exec $NODERED_SERVICE sh -c "cd /data && npm install --unsafe-perm /data/offline_modules/modules/node-xlsx-0.24.0.tgz"
docker exec $NODERED_SERVICE sh -c "cd /data && npm install --unsafe-perm /data/offline_modules/modules/formidable-3.5.4.tgz"

docker exec $NODERED_SERVICE sh -c "cd /data && npm install --no-audit --offline node-red-contrib-postgresql@0.14.2" \
|| error "node-red install postgresq failed!"

docker exec $NODERED_SERVICE sh -c "cd /data && npm install --offline --prefix /data /data/offline_modules/node-supmodel-${MQTT_PLUG:-emqx}" \
|| error "node-red install supmodel failed!"


# overide js file
docker exec $NODERED_SERVICE sh -c 'cp /data/override/*.js /usr/src/node-red/node_modules/@node-red/editor-client/public/red/' >/dev/null

docker exec --user 0 $NODERED_SERVICE bash -c "node -e '
const fs = require(\"fs\");
const p = \"/data/.config.nodes.json\";

// 读取配置文件
const j = JSON.parse(fs.readFileSync(p, \"utf8\"));

// 获取 node-red-contrib-modbus 模块的节点
const modbusPkg = j[\"node-red-contrib-modbus\"];
if(modbusPkg && modbusPkg.nodes) {
    const modbusKeep = new Set([\"Modbus-Read\", \"Modbus-Client\", \"Modbus-Server\"]);
    for (const [name, meta] of Object.entries(modbusPkg.nodes)) {
        meta.enabled = modbusKeep.has(name);
    }
    console.log(\"Updated Modbus nodes\");
} else {
    console.error(\"node-red-contrib-modbus not found\");
}

// 获取 node-red-contrib-opcua 模块的节点
const opcuaPkg = j[\"node-red-contrib-opcua\"];
if(opcuaPkg && opcuaPkg.nodes) {
    const opcuaKeep = new Set([\"OpcUa-Item\", \"OpcUa-Client\", \"OpcUa-Server\"]);
    for (const [name, meta] of Object.entries(opcuaPkg.nodes)) {
        meta.enabled = opcuaKeep.has(name);  // 如果是 keep 中的节点，启用
    }
    console.log(\"Updated OPC UA nodes\");
} else {
    console.error(\"node-red-contrib-opcua not found\");
}

// 保存更新后的 JSON 文件
fs.writeFileSync(p, JSON.stringify(j, null, 2));
console.log(\"Updated:\", p);
'"





docker restart $NODERED_SERVICE >/dev/null