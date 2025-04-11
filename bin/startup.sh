#!/bin/bash

# exit error
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd)"
source $SCRIPT_DIR/global/log.sh
source $SCRIPT_DIR/global/choose-profile-command.sh

# 去掉回车等符号，避免出现^m
sed -i 's/\r$//' $SCRIPT_DIR/../.env

# 检测系统平台
platform=$(uname -s)
if [[ "$platform" == MINGW64* ]]; then
    # Windows平台设置
    sed -i \
        -e "s/^OS_RESOURCE_SPEC=.*/OS_RESOURCE_SPEC=1/" \
        -e "s/^OS_PLATFORM_TYPE=.*/OS_PLATFORM_TYPE=windows/" \
        $SCRIPT_DIR/../.env

    current_volumes_path=$(grep '^VOLUMES_PATH=' "$SCRIPT_DIR/../.env" | cut -d '=' -f2-)
    default_volumes_path="/d/volumes/supos/data"
    read -p "Enter VOLUMES_PATH [$default_volumes_path]: " volumes_path
    volumes_path=${volumes_path:-$default_volumes_path}

    if [ "$volumes_path" != "$current_volumes_path" ]; then
      escaped_volumes_path=$(sed 's/[&]/\\&/g' <<< "$volumes_path")
      sed -i "s|^VOLUMES_PATH=.*|VOLUMES_PATH=$escaped_volumes_path|" "$SCRIPT_DIR/../.env"
    fi

    current_entrance_domain=$(grep '^ENTRANCE_DOMAIN=' "$SCRIPT_DIR/../.env" | cut -d '=' -f2-)
    read -p "Enter IP address for ENTRANCE_DOMAIN [$current_entrance_domain]: " selected_ip
    selected_ip=${selected_ip:-$current_entrance_domain}

    if [ "$selected_ip" != "$current_entrance_domain" ]; then
      escaped_selected_ip=$(sed 's/[&]/\\&/g' <<< "$selected_ip")
      sed -i "s|^ENTRANCE_DOMAIN=.*|ENTRANCE_DOMAIN=$escaped_selected_ip|" "$SCRIPT_DIR/../.env"
    fi
else
    # 非Windows平台获取本地IP地址(取前3个)
    ips=($(hostname -I | awk '{print $1, $2, $3}'))
    echo -e "\nAvailable options for ENTRANCE_DOMAIN:"
    current_entrance_domain=$(grep '^ENTRANCE_DOMAIN=' "$SCRIPT_DIR/../.env" | cut -d '=' -f2-)
    echo "0). Keep current: $current_entrance_domain (default)"

    for i in "${!ips[@]}"; do
      echo "$((i+1))). ${ips[$i]}"
    done

    while true; do
      read -p "Select option (0-${#ips[@]}), or press Enter to keep current: " choice

      if [[ -z "$choice" ]] || [[ "$choice" == "0" ]]; then
          selected_ip="$current_entrance_domain"
          echo "Keeping current ENTRANCE_DOMAIN: $selected_ip"
          break
      elif [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le "${#ips[@]}" ]; then
        selected_ip=${ips[$((choice-1))]}
        echo "Selected IP: $selected_ip"
        break
      else
        echo "Invalid input. Please enter a valid option number (0-${#ips[@]}) or press Enter."
      fi
    done

    if [ "$selected_ip" != "$current_entrance_domain" ]; then
      escaped_selected_ip=$(sed 's/[&]/\\&/g' <<< "$selected_ip")
      sed -i "s|^ENTRANCE_DOMAIN=.*|ENTRANCE_DOMAIN=$escaped_selected_ip|" "$SCRIPT_DIR/../.env"
    fi
fi
cat $SCRIPT_DIR/../.env && echo -e "\n"
read -p "Please confirm env properties, do you want to continue? (y/n): " confirmation

if [[ "$confirmation" != "y" && "$confirmation" != "Y" ]]; then
    exit 0
fi

# 检查ENTRANCE_DOMAIN是否为本地地址
entrance_domain=$(grep -E '^ENTRANCE_DOMAIN=' $SCRIPT_DIR/../.env | sed -e 's/^ENTRANCE_DOMAIN=//' -e 's/[ "\t]//g')
if [[ "$entrance_domain" == "127.0.0.1" ]]; then
    echo -e "\n"
    read -p "WARNING: Are you sure you want to visit the platform by 127.0.0.1? (y/n): " confirm_ip
    if [[ "$confirm_ip" != "y" && "$confirm_ip" != "Y" ]]; then
        exit 0
    fi
    echo -e "\n"
fi

# 执行安装docker脚本
bash $SCRIPT_DIR/install-deb/install-docker.sh

# 设置.env环境变量
source $SCRIPT_DIR/../.env

# 设置.env.tmp临时环境变量
if [ "$LANGUAGE" == "zh-CN" ]; then
  echo "GRAFANA_LANG=zh-Hans" > $SCRIPT_DIR/../.env.tmp
  echo "FUXA_LANG=zh-cn" >> $SCRIPT_DIR/../.env.tmp
else
  echo "GRAFANA_LANG=en-US" > $SCRIPT_DIR/../.env.tmp
  echo "FUXA_LANG=en" >> $SCRIPT_DIR/../.env.tmp
fi

# 替换文件变量
bash $SCRIPT_DIR/init/generate-keycloak-sql.sh && bash $SCRIPT_DIR/init/generate-kong-property.sh

DOCKER_COMPOSE_FILE=$SCRIPT_DIR/../docker-compose-8c16g.yml
if [ "$OS_RESOURCE_SPEC" == "1" ]; then
  DOCKER_COMPOSE_FILE=$SCRIPT_DIR/../docker-compose-4c8g.yml
fi

# 选择需要启动哪些服务
if [ ! -f $VOLUMES_PATH/backend/system/active-services.txt ]; then 
  if [ "$OS_RESOURCE_SPEC" == "1" ]; then
    command=$(chooseProfile1)
  else
    command=$(chooseProfile2)
  fi
else 
  command=$(sed -n '2p' $VOLUMES_PATH/backend/system/active-services.txt)
fi

# 判断是否启用了ELK
if echo "$command" | grep -q "elk"; then
  echo "ENABLE_ELK=true" >> $SCRIPT_DIR/../.env.tmp
  echo "ENABLE_ELK_MENU=menu" >> $SCRIPT_DIR/../.env.tmp
else
   echo "ENABLE_ELK=false" >> $SCRIPT_DIR/../.env.tmp
   echo "ENABLE_ELK_MENU=none" >> $SCRIPT_DIR/../.env.tmp
fi

# 替换文件变量
bash $SCRIPT_DIR/init/generate-keycloak-sql.sh && bash $SCRIPT_DIR/init/generate-kong-property.sh

# 创建volumes目录, 将mount目录迁移到volumes目录
if [ -d "$VOLUMES_PATH" ] && [ "$(ls -A $VOLUMES_PATH)" ]; then
  echo "Info: stop services ..."
  docker compose --project-name supos $command -f $DOCKER_COMPOSE_FILE stop > /dev/null 2>&1
  echo "Info: complete!"
  bash $SCRIPT_DIR/init/update-volumes.sh $VOLUMES_PATH
else
  bash $SCRIPT_DIR/init/create-volumes.sh $VOLUMES_PATH
fi

# 加载本地镜像
if [ -d "$SCRIPT_DIR/../images/" ] && [ "$(ls -A $SCRIPT_DIR/../images/)" ]; then
  bash $SCRIPT_DIR/init/load-images.sh
fi

# docker compose执行成功后，初始化node-red自定义节点
docker compose --env-file $SCRIPT_DIR/../.env --env-file $SCRIPT_DIR/../.env.tmp --project-name supos $command -f $DOCKER_COMPOSE_FILE up -d && \
bash $SCRIPT_DIR/init/node-red-init.sh 1880 nodered $1 && \
bash $SCRIPT_DIR/init/node-red-init.sh 1889 eventflow $1 && \
bash $SCRIPT_DIR/init/minio-init.sh $1 > /dev/null 2>&1

rm -f $SCRIPT_DIR/../.env.tmp > /dev/null 2>&1
