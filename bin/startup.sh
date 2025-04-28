#!/bin/bash

# exit error
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd)"
source $SCRIPT_DIR/global/log.sh
source $SCRIPT_DIR/global/choose-profile-command.sh

# Remove symbols such as carriage returns to avoid ^m
sed -i 's/\r$//' $SCRIPT_DIR/../.env

# Inspection System Version
platform=$(uname -s)
if [[ "$platform" == MINGW64* ]]; then
    # Settings for Windows
    sed -i \
        -e "s/^OS_PLATFORM_TYPE=.*/OS_PLATFORM_TYPE=windows/" \
        $SCRIPT_DIR/../.env

    current_volumes_path=$(grep '^VOLUMES_PATH=' "$SCRIPT_DIR/../.env" | cut -d '=' -f2-)
    default_volumes_path="/d/volumes/supos/data"
    read -p "Choose VOLUMES_PATH: (Enter for default:[$default_volumes_path])" volumes_path
    volumes_path=${volumes_path:-$default_volumes_path}

    if [ "$volumes_path" != "$current_volumes_path" ]; then
      escaped_volumes_path=$(sed 's/[&]/\\&/g' <<< "$volumes_path")
      sed -i "s|^VOLUMES_PATH=.*|VOLUMES_PATH=$escaped_volumes_path|" "$SCRIPT_DIR/../.env"
    fi

    # 读取 .env 中的 ENTRANCE_DOMAIN 值，并清理首尾空格
    current_entrance_domain=$(grep '^ENTRANCE_DOMAIN=' "$SCRIPT_DIR/../.env" | cut -d '=' -f2-)
    current_entrance_domain=$(echo "$current_entrance_domain" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
    sed -i "s/^ENTRANCE_DOMAIN=.*/ENTRANCE_DOMAIN=$current_entrance_domain/" "$SCRIPT_DIR/../.env"

# 判断是否存在默认值
if [[ -n "$current_entrance_domain" ]]; then
    # 有默认值，允许回车使用
    while true; do
        read -p "Choose IP address for ENTRANCE_DOMAIN (Enter for default: [$current_entrance_domain]): " selected_ip
        selected_ip=$(echo "$selected_ip" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
        selected_ip=${selected_ip:-$current_entrance_domain}

        if [[ -z "$selected_ip" ]]; then
            echo "Input cannot be empty. Please enter a valid IP."
        else
            break
        fi
    done
else
    # 没有默认值，强制输入
    while true; do
        read -p "Choose IP address for ENTRANCE_DOMAIN: " selected_ip
            selected_ip=$(echo "$selected_ip" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
        if [[ -z "$selected_ip" ]]; then
            echo "Input cannot be empty. Please enter a valid IP."
        else
            break
        fi
    done
fi


    if [ "$selected_ip" != "$current_entrance_domain" ]; then
      escaped_selected_ip=$(sed 's/[&]/\\&/g' <<< "$selected_ip")
      sed -i "s|^ENTRANCE_DOMAIN=.*|ENTRANCE_DOMAIN=$escaped_selected_ip|" "$SCRIPT_DIR/../.env"
    fi
else
    # Non-Windows platform to get local IP address (take the first 3)
    ips=($(hostname -I | awk '{print $1, $2, $3}'))
    echo -e "\nAvailable options for ENTRANCE_DOMAIN:"
    current_entrance_domain=$(grep '^ENTRANCE_DOMAIN=' "$SCRIPT_DIR/../.env" | cut -d '=' -f2-)
    current_entrance_domain=$(echo "$current_entrance_domain" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
    sed -i "s/^ENTRANCE_DOMAIN=.*/ENTRANCE_DOMAIN=$current_entrance_domain/" "$SCRIPT_DIR/../.env"
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

# Check if ENTRANCE_DOMAIN is a local loopback address
entrance_domain=$(grep -E '^ENTRANCE_DOMAIN=' $SCRIPT_DIR/../.env | sed -e 's/^ENTRANCE_DOMAIN=//' -e 's/[ "\t]//g')
entrance_domain=$(echo "$entrance_domain" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
if [[ "$entrance_domain" == "127.0.0.1" || "$entrance_domain" == "localhost" ]]; then
  echo -e "\n"
  read -rp "WARNING: You are using IP address 127.0.0.1/localhost. \
Login and authentication functions will NOT work. \
Proceed without login? (y/N): " confirm_ip
  if [[ ! "$confirm_ip" =~ ^[yY]$ ]]; then
    echo "Aborted."
    exit 0
  fi
  # >>> Force authentication OFF for local deployments
  sed -i -E \
    -e 's/^OS_AUTH_ENABLE=.*/OS_AUTH_ENABLE=false/' \
    "$SCRIPT_DIR/../.env"
  echo "Authentication disabled because ENTRANCE_DOMAIN is local."
  echo -e "\n"
fi

# Execute the installation docker script
bash $SCRIPT_DIR/install-deb/install-docker.sh

# Setting the .env environment variable
source $SCRIPT_DIR/../.env

# Select which services need to be started
if [ ! -f $VOLUMES_PATH/backend/system/active-services.txt ]; then 
  if [ "$OS_RESOURCE_SPEC" == "1" ]; then
    command=$(chooseProfile1)
  else
    command=$(chooseProfile2)
  fi
else 
  command=$(sed -n '2p' $VOLUMES_PATH/backend/system/active-services.txt)
fi

bash $SCRIPT_DIR/util/append-tempenv.sh "$command"

DOCKER_COMPOSE_FILE=$SCRIPT_DIR/../docker-compose-8c16g.yml
if [ "$OS_RESOURCE_SPEC" == "1" ]; then
  DOCKER_COMPOSE_FILE=$SCRIPT_DIR/../docker-compose-4c8g.yml
fi

# Replacement of file variables
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

# Load local images
if [ -d "$SCRIPT_DIR/../images/" ] && [ "$(ls -A $SCRIPT_DIR/../images/)" ]; then
  bash $SCRIPT_DIR/init/load-images.sh
fi


if docker compose --env-file $SCRIPT_DIR/../.env --env-file $SCRIPT_DIR/../.env.tmp --project-name supos $command -f $DOCKER_COMPOSE_FILE up -d && \
   bash $SCRIPT_DIR/init/node-red-init.sh 1880 nodered $1 && \
   #bash $SCRIPT_DIR/init/node-red-init.sh 1889 eventflow $1 && \
   bash $SCRIPT_DIR/init/minio-init.sh $1 > /dev/null 2>&1 && \
   bash $SCRIPT_DIR/init/portainer-init.sh; then

    echo -e "\n============================================================"
    echo -e "🎉  All services are up and running!"
    echo -e "👉  Open the platform in your browser:\n"

    if [[ "$ENTRANCE_PORT" == "80" || "$ENTRANCE_PORT" == "443" ]]; then
      PLATFORM_URL="${ENTRANCE_PROTOCOL}://${ENTRANCE_DOMAIN}/home"
    else
      PLATFORM_URL="${ENTRANCE_PROTOCOL}://${ENTRANCE_DOMAIN}:${ENTRANCE_PORT}/home"
    fi

    echo -e "      $PLATFORM_URL\n"
    echo -e "    Default superadmin and password : supos/Supos@1304 \n"
    echo -e "============================================================"

else
    echo -e "\n❌ ERROR: One or more steps failed during startup. Please check the logs above."
    exit 1
fi

rm -f $SCRIPT_DIR/../.env.tmp > /dev/null 2>&1
