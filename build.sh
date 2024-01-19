#!/usr/bin/env bash

set -e

docker login docker.io

IMAGE_NAME=docker.io/goforbroke1006/golang-tdlib

(
  IMAGE_TAG=1.20-master

  docker pull ${IMAGE_NAME}:${IMAGE_TAG} || true
  docker build -f ./golang-1.20-tdlib-master.Dockerfile -t ${IMAGE_NAME}:${IMAGE_TAG} .
  docker push ${IMAGE_NAME}:${IMAGE_TAG}
)

(
  IMAGE_TAG=1.21-master

  docker pull ${IMAGE_NAME}:${IMAGE_TAG} || true
  docker build -f ./golang-1.21-tdlib-master.Dockerfile -t ${IMAGE_NAME}:${IMAGE_TAG} .
  docker push ${IMAGE_NAME}:${IMAGE_TAG}
)
