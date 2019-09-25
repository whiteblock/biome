#!/bin/bash -xeu

export WB_BRANCH=${WB_BRANCH:-dev}
export WB_TOKEN_ISSUER=${WB_TOKEN_ISSUER:-api.whiteblock.io}

pushd /root/biome

docker-compose down

docker-compose pull

./update-cli.sh

docker-compose up -d

popd
