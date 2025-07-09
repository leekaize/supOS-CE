#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd)"


# 删除kong数据库
docker rm -f kong > /dev/null 2>&1
docker exec -it postgresql bash -c 'PGPASSWORD="postgres" psql -U postgres -c "DROP DATABASE IF EXISTS kong;"'
docker exec -it postgresql bash -c 'PGPASSWORD="postgres" psql -U postgres -c "CREATE DATABASE kong;"'

source $SCRIPT_DIR/../.env
DOCKER_COMPOSE_FILE=$SCRIPT_DIR/../docker-compose-8c16g.yml
if [ "$OS_RESOURCE_SPEC" == "1" ]; then
  DOCKER_COMPOSE_FILE=$SCRIPT_DIR/../docker-compose-4c8g.yml
fi

# 卸载所有服务
command="--profile fuxa --profile grafana --profile minio --profile tdengine --profile tsdb --profile elk --profile mcpclient "

if [ -f $SCRIPT_DIR/../.env.tmp ]; then 
  docker compose --env-file $SCRIPT_DIR/../.env --env-file $SCRIPT_DIR/../.env.tmp --project-name supos $command -f $DOCKER_COMPOSE_FILE down && rm -f $VOLUMES_PATH/backend/system/active-services.txt
else 
  docker compose --env-file $SCRIPT_DIR/../.env --project-name supos $command -f $DOCKER_COMPOSE_FILE down && rm -f $VOLUMES_PATH/backend/system/active-services.txt
fi

rm -f $SCRIPT_DIR/../.env.tmp > /dev/null 2>&1
#docker volume ls -q --filter "name=supos" | xargs docker volume rm
# 删除所有app的容器
docker ps -a -q --filter "network=supos_default_network" | xargs --no-run-if-empty docker rm -f > /dev/null 2>&1

