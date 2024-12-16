#!/bin/bash

PORTS="5000:5000"
CONTAINER_NAME="flex"
IMAGE_NAME="maric77/flexbox:flex"

#login to Docker Hub
echo "${DOCKER_HUB_TOKEN}" | docker login -u "${DOCKER_HUB_USERNAME}" --password-stdin

#Pull image in DockerHub
docker pull "${IMAGE_NAME}"
    
# check if container exists or not
if [[ $(docker ps -qqa -f name="${CONTAINER_NAME}") ]] ; then 
  docker container stop flex && docker container rm flex
fi 
docker run -d -p ${PORTS} --name ${CONTAINER_NAME} ${IMAGE_NAME}

#remove
docker container prune -f 

#image
docker image prune -f


