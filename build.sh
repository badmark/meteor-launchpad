#!/bin/bash

set -e

IMAGE_NAME=${1:-"badmark/meteor-launchpad"}

printf "\n[-] Building $IMAGE_NAME...\n\n"

docker build -f dev.dockerfile -t $IMAGE_NAME:devbuild .
docker build -t $IMAGE_NAME:latest .
