#!/bin/bash

mv cuda/__init__.py.bk cuda/__init__.py

docker build --no-cache --network host -t cuda_whl_builder .
docker run -d --name cuda_whl_builder-container cuda_whl_builder
docker ps -all

DOCKER_CONTAINER_ID=$(docker ps -aqf "name=cuda_whl_builder-container")
# Then find the docker Container ID and copy the result
docker cp $DOCKER_CONTAINER_ID:/result . && docker stop $DOCKER_CONTAINER_ID && docker rm $DOCKER_CONTAINER_ID

mv cuda/__init__.py cuda/__init__.py.bk