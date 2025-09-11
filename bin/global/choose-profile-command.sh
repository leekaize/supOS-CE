#!/bin/bash

activeServices="emqx,nodered,keycloak,kong,postgresql,chat2db,portainer"
profileCommand=""
OUTPUT_FILE=$SCRIPT_DIR/global/active-services.txt

chooseProfile1() {
    # [MODIFIED] Check for a non-interactive "mode" argument
    local mode=${1:-interactive} # Default to 'interactive' if no argument is given
    local askyou

    if [[ "$mode" == "interactive" ]]; then
        # This is the original interactive logic
        echo -e "\n"
        if [[ "$LANGUAGE" == "zh-CN" ]]; then
            read -p "您是否需要自定义安装哪些服务? [1] 不，使用默认配置即可(默认) [2] 是的，我要选择 " askyou
        else
            read -p "Do you need to customize which services to install? [1] No, use defaults(default) [2] Yes " askyou
        fi
        askyou=$(echo "$askyou" | xargs)
        askyou=${askyou:-1}
    else
        # [NEW] If not interactive, force the default choice '1'
        askyou=1
    fi

    if [[ $askyou == 1 ]]; then
        # This is the single source of truth for the default profile
        profileCommand+="--profile grafana --profile tsdb "
        activeServices+=",grafana,tsdb"
    else
        # ... (custom selection logic remains unchanged) ...
        read -p "Step 1: Do you want to install Grafana?[y/n]: " choicegrafana; choicegrafana=${choicegrafana:-Y}
        if [[ $choicegrafana =~ ^[Yy] ]]; then profileCommand+="--profile grafana "; activeServices+=",grafana"; fi
        read -p "Step 2:Do you want to install MinIO?[y/n]: " choiceminio; choiceminio=${choiceminio:-Y}
        if [[ $choicemcp =~ ^[Yy] ]]; then profileCommand+="--profile minio "; activeServices+=",minio"; fi
        read -p "Step 3: Do you want to install MCP-Client?[y/n]: " choicemcp; choicemcp=${choicemcp:-Y}
        if [[ $choicemcp =~ ^[Yy] ]]; then profileCommand+="--profile mcpclient "; activeServices+=",mcpclient"; fi
        if [[ "$LANGUAGE" == "zh-CN" ]]; then read -p "Step 4: 请选择一种时序数据库: [1] TimescaleDB(默认)  [2] TDEngine " choicedb; else read -p "Step 4: Please select a time-series database: [1] TimescaleDB(default)  [2] TDEngine " choicedb; fi
        choicedb=${choicedb:-1}
        if [[ $choicedb == 1 ]]; then profileCommand+="--profile tsdb "; activeServices+=",tsdb"; else profileCommand+="--profile tdengine "; activeServices+=",tdengine"; fi
    fi

    mkdir -p "$(dirname "$OUTPUT_FILE")"
    echo "$activeServices" > "$OUTPUT_FILE"
    echo "$profileCommand" >> "$OUTPUT_FILE"

    echo "$profileCommand"
}

chooseProfile2() {
    # [MODIFIED] Check for a non-interactive "mode" argument
    local mode=${1:-interactive} # Default to 'interactive' if no argument is given
    local askyou

    if [[ "$mode" == "interactive" ]]; then
        # This is the original interactive logic
        echo -e "\n"
        if [[ "$LANGUAGE" == "zh-CN" ]]; then read -p "您是否需要自定义安装哪些服务? [1] 不，使用默认配置即可(默认) [2] 是的，我要选择 " askyou; else read -p "Do you need to customize which services to install? [1] No, use defaults(default) [2] Yes " askyou; fi
        askyou=$(echo "$askyou" | xargs)
        askyou=${askyou:-1}
    else
        # [NEW] If not interactive, force the default choice '1'
        askyou=1
    fi

    if [[ $askyou == 1 ]]; then
        # This is the single source of truth for the default profile
        profileCommand="--profile grafana --profile tsdb "
        activeServices+=",grafana,tsdb"
    else
        # ... (custom selection logic remains unchanged) ...
        read -p "Step 1: Do you want to install Grafana? [y/n]: " choicegrafana; choicegrafana=${choicegrafana:-Y}
        if [[ $choicegrafana =~ ^[Yy] ]]; then profileCommand+="--profile grafana "; activeServices+=",grafana"; fi
        read -p "Step 2: Do you want to install MinIO? [y/n]: " choiceminio; choiceminio=${choiceminio:-Y}
        if [[ $choicemcp =~ ^[Yy] ]]; then profileCommand+="--profile minio "; activeServices+=",minio"; fi
        read -p "Step 3: Do you want to install elasticsearch, kibana and filebeat? [y/n]: " choiceelk; choiceelk=${choiceelk:-Y}
        if [[ $choiceelk =~ ^[Yy] ]]; then profileCommand+="--profile elk "; activeServices+=",elk"; fi
        read -p "Step 4: Do you want to install MCP-Client?[y/n]: " choicemcp; choicemcp=${choicemcp:-Y}
        if [[ $choicemcp =~ ^[Yy] ]]; then profileCommand+="--profile mcpclient "; activeServices+=",mcpclient"; fi
        read -p "Step 5: Do you want to install Gitea?[y/n]: " choiceGitea; choiceGitea=${choiceGitea:-Y}
        if [[ $choiceGitea =~ ^[Yy] ]]; then profileCommand+="--profile gitea "; activeServices+=",gitea"; fi
        if [[ "$LANGUAGE" == "zh-CN" ]]; then read -p "Step 6: 请选择一种时序数据库: [1] TimescaleDB(默认)  [2] TDEngine " choicedb; else read -p "Step 6: Please select a time-series database: [1] TimescaleDB(default)  [2] TDEngine " choicedb; fi
        choicedb=${choicedb:-1}
        if [[ $choicedb == 1 ]]; then profileCommand+="--profile tsdb "; activeServices+=",tsdb"; else profileCommand+="--profile tdengine "; activeServices+=",tdengine"; fi
    fi

    mkdir -p "$(dirname "$OUTPUT_FILE")"
    echo "$activeServices" > "$OUTPUT_FILE"
    echo "$profileCommand" >> "$OUTPUT_FILE"

    echo "$profileCommand"
}