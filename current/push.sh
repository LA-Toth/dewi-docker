#!/usr/bin/env bash

set -Eeuo pipefail
shopt -s nullglob

. versions
DOCKER_NAME=$(<../name)

if [[ $DEWI_DOCKER_TAG == latest ]]; then
  DEWI_DOCKER_TAGS=latest
else
  DEWI_DOCKER_TAGS=$(echo $DEWI_DOCKER_TAG | awk '{ split($0, a, "."); printf "%s\n%d.%d\n%d\n", $0, a[1], a[2], a[1] }')
fi

for i in $DEWI_DOCKER_TAGS; do
  docker push $DOCKER_NAME:$i
done
