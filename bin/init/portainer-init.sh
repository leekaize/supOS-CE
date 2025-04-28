#!/bin/bash

# exit error
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd)"
source $SCRIPT_DIR/../global/log.sh
source $SCRIPT_DIR/../../.env

echo ">> start to init portainer OAuth ..."

# Determine the port string to use
PORT_STRING=""
if [[ ("$ENTRANCE_PROTOCOL" == "https" && "$ENTRANCE_PORT" == "443") || ("$ENTRANCE_PROTOCOL" == "http" && "$ENTRANCE_PORT" == "80") ]]; then
  PORT_STRING=""
else
  PORT_STRING=":$ENTRANCE_PORT"
fi

PORTAINER_JWT=`docker exec nodered curl -skX POST https://portainer:9443/api/auth      -H "Content-Type: application/json"      -d '{"username": "admin", "password": "adminpassword"}' | awk -F'"' '/jwt/ {print $4}'` && echo "Successfully got Portainer JWT"\
|| if [ "$1" == "--verbose" ]; then warn "Failed to obtain JWT from Portainer"; fi

docker exec nodered curl -skX POST "https://portainer:9443/api/users"   -H "Authorization: Bearer $PORTAINER_JWT"   -H "Content-Type: application/json"   -d '{    "Username": "supos",    "Password": "Supos@13041304",    "Email": "supos@supos.com","Role": 1 }' > /dev/null 2>&1 && echo "Successfully created administrator 'supos'"\
|| if [ "$1" == "--verbose" ]; then warn "Failed to create administrator 'supos'"; fi

docker exec nodered curl -skX PUT "https://portainer:9443/api/settings" \
   -H "Authorization: Bearer $PORTAINER_JWT" \
   -H "Content-Type: application/json" \
   -d "{
     \"authenticationMethod\": 3,
     \"oauthSettings\": {
       \"AccessTokenURI\": \"$ENTRANCE_PROTOCOL://$ENTRANCE_DOMAIN${PORT_STRING}/keycloak/home/auth/realms/supos/protocol/openid-connect/token\",
       \"AuthStyle\": 0,
       \"AuthorizationURI\": \"$ENTRANCE_PROTOCOL://$ENTRANCE_DOMAIN${PORT_STRING}/keycloak/home/auth/realms/supos/protocol/openid-connect/auth\",
       \"ClientID\": \"$OAUTH_CLIENT_ID\",
       \"ClientSecret\": \"$OAUTH_CLIENT_SECRET\",
       \"OAuthAutoCreateUsers\": true,
       \"RedirectURI\": \"$ENTRANCE_PROTOCOL://$ENTRANCE_DOMAIN${PORT_STRING}/portainer/home/\",
       \"ResourceURI\": \"$ENTRANCE_PROTOCOL://$ENTRANCE_DOMAIN${PORT_STRING}/keycloak/home/auth/realms/supos/protocol/openid-connect/userinfo\",
       \"SSO\": true,
       \"UserIdentifier\":\"preferred_username\",
       \"Scopes\":\"openid\"
     },
     \"userSessionTimeout\": \"1h\"
   }" > /dev/null 2>&1 \
&& echo "Successfully set Portainer OAuth"\
|| if [ "$1" == "--verbose" ]; then warn "Failed to set Portainer OAuth"; fi

echo "<< Finished setting Portainer OAuth"
