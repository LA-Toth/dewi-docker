#!/usr/bin/env bash

set -Eeuo pipefail
shopt -s nullglob

. versions
DOCKER_NAME=$(<../name)

docker build -t dewi:$DEWI_DOCKER_TAG \
  --build-arg DEWI_COMMANDS_VERSION=$dewi_commands_version \
  --build-arg DEWI_CORE_VERSION=$dewi_core_version \
  --build-arg DEWI_LOGPARSERS_VERSION=$dewi_logparsers_version \
  --build-arg DEWI_MODULE_FRAMEWORK_VERSION=$dewi_module_framework_version \
  --build-arg DEWI_REALTIME_SYNC_VERSION=$dewi_realtime_sync_version \
  --build-arg DEWI_UTILS_VERSION=$dewi_utils_version \
  --build-arg DEWI_VERSION=$dewi_version \
  ../current/dewi/

if [[ $DEWI_DOCKER_TAG == latest ]]; then
  DEWI_DOCKER_TAGS=latest
else
  DEWI_DOCKER_TAGS=$(echo $DEWI_DOCKER_TAG | awk '{ split($0, a, "."); printf "%s\n%d.%d\n%d\n", $0, a[1], a[2], a[1] }')
fi

for i in $DEWI_DOCKER_TAGS; do
  docker tag dewi:$DEWI_DOCKER_TAG $DOCKER_NAME:$i
done
