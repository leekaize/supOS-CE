#!/bin/bash

# exit error
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd)"
source $SCRIPT_DIR/../global/log.sh

echo ">> start to init minio"
docker exec minio bash -c "mc alias set myminio http://minio:9000 admin adminpassword" \
||  if [ "$1" == "--verbose" ]; then error "failed to mc alias"; fi

docker exec minio bash -c "mc admin policy create myminio public-delete-policy /data/public-delete-policy.json" \
||  if [ "$1" == "--verbose" ]; then error "failed to create policy public-delete-policy"; fi

docker exec minio bash -c "mc mb myminio/supos" \
|| if [ "$1" == "--verbose" ]; then warn "failed to make bucket 'supos', perhaps already exited?"; fi

docker exec minio bash -c "mc anonymous set public myminio/supos" \
|| if [ "$1" == "--verbose" ]; then error "failed to set bucket 'supos' as public access"; fi

docker exec minio bash -c "mc mirror --overwrite /data/supos myminio/supos > /dev/null && echo 'Copy frontend .svg completed successfully.' \
|| warn 'Copy frontend .svg failed.'" > /dev/null 2>&1
docker restart minio && echo '<< minio restarted successfully' || error "failed to restart minio"

