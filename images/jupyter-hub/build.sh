#!/bin/bash


UBUNTU_VER="focal"

set -e

## Build Docker image
docker build --build-arg SP_VERSION=${SPARK_VER} --build-arg JV_VERSION=${JAVA_VER} --build-arg SC_VERSION=${SCALA_VERSION} \
             --build-arg HD_VERSION=${HADOOP_VER} --build-arg SP_G_PKG=${SPARK_GRAPH_PKG} --build-arg SP_D_PKG=${SPARK_DELTA_PKG} \
             -t lasid/spark-base:${SPARK_VER}_${UBUNTU_VER}  -t lasid/spark-base:latest ./docker/spark-base
docker build --build-arg SP_VERSION=${SPARK_VER} -t lasid/spark-worker:${SPARK_VER}_${UBUNTU_VER} \
             -t lasid/spark-worker:latest ./docker/spark-worker

## Push image to DockerHub
docker login
#docker push lasid/spark-worker:latest
docker push lasid/spark-worker:${SPARK_VER}_${UBUNTU_VER}



