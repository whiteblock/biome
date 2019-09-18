#!/bin/bash -xeu
export WB_BRANCH=${WB_BRANCH:-dev}
IMAGE=gcr.io/whiteblock/cli:$WB_BRANCH

CONTAINER_NAME=wb_cli_updater

set +e
sudo -i docker rm -f "$CONTAINER_NAME"
set -e

sudo -i docker pull "$IMAGE"
sudo -i docker run --name "$CONTAINER_NAME" --entrypoint /bin/true "$IMAGE"
sudo -i docker cp "$CONTAINER_NAME":/cli/whiteblock/whiteblock /usr/local/bin/whiteblock
sudo -i rm /etc/whiteblock.json || true
sudo -i docker cp "$CONTAINER_NAME":/cli/etc/whiteblock.json /etc/whiteblock.json
sudo -i chmod a+x /usr/local/bin/whiteblock
sudo -i ln -sf /usr/local/bin/whiteblock /usr/local/bin/wb

sudo -i docker rm -f "$CONTAINER_NAME"
