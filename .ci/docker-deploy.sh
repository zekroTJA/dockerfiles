#!/bin/bash

set -e

ROOT=$PWD

docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

echo "Build image zekro/evc..."
cd $ROOT/evc
docker build . -t zekro/evc:latest
docker push zekro/evc:latest
