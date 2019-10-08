#!/bin/bash -xeu

export WB_BRANCH=${WB_BRANCH:-dev}

pushd /root/biome

docker-compose down

docker-compose pull

docker-compose up -d

popd
