#!/bin/bash

UBUNTU_VER="jammy"
VERSION="1.0"
set -e

## Build Docker image
docker build -t lasid/jupyter-hub:${SPARK_VER}_${UBUNTU_VER} \
             -t lasid/jupyter-hub:latest .

## Push image to DockerHub
docker login
docker push lasid/jupyter-hub:latest
docker push lasid/jupyter-hub:${VERSION}_${UBUNTU_VER}
