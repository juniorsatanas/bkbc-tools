#!/bin/bash

set -e

if [ "$1" = "" ] || [ "$1" = "--help" ]; then
  cat <<EOF
No command specified. Valid commands include:

  * build: Build the docker container(s)
  * start: Start paused container
  * stop: Stop running container
  * run: Run the container
  * rpc: Execute bitcoind RPC call (try> ./do rpc getinfo)

See https://github.com/binaryage/bitcoind-docker for details.
EOF
  exit 1
fi

# ----------------------------------

if [ "$1" = "build" ]; then
  set -x
  docker build --rm -t test/bitcoind .
elif [ "$1" == "rm" ]; then
  set -x
  docker rm $BITCOIND_NODE_CONTAINER_NAME
elif [ "$1" == "run" ]; then
  set -x
  bin/bitcoindctl serve
elif [ "$1" == "start" ]; then
  set -x
  docker start $BITCOIND_NODE_CONTAINER_NAME
elif [ "$1" == "stop" ]; then
  set -x
  docker stop $BITCOIND_NODE_CONTAINER_NAME
elif [ "$1" == "rpc" ]; then
  set -x
  bin/bitcoindctl $@
else
  echo "unknown command, run ./do --help"
fi
