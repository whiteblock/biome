#!/bin/bash -xeu
export WB_BRANCH=${WB_BRANCH:-dev}
IMAGE=gcr.io/whiteblock/cli:$WB_BRANCH

CONTAINER_NAME=wb_cli_updater

set +e
docker rm -f "$CONTAINER_NAME"
set -e

docker pull "$IMAGE"
docker run --name "$CONTAINER_NAME" --entrypoint /bin/true "$IMAGE"
docker cp "$CONTAINER_NAME":/cli/whiteblock/whiteblock /usr/local/bin/whiteblock
rm /etc/whiteblock.json || true
docker cp "$CONTAINER_NAME":/cli/etc/whiteblock.json /etc/whiteblock.json
chmod a+x /usr/local/bin/whiteblock
ln -sf /usr/local/bin/whiteblock /usr/local/bin/wb

docker rm -f "$CONTAINER_NAME"
