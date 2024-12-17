#!/bin/bash
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl enable docker
sudo docker --version
sudo chown root:docker /var/run/docker.sock
sudo chmod a+w /var/run/docker.sock
gcloud storage cp gs://deploy-file/frontend-script/bash_test.sh .
chmod a+x *.sh
#pull image
PORTS="5000:5000"
CONTAINER_NAME="flex"
REPOSITORY="maric77/refonte-test"
IMAGE_NAME="test"

#login to Docker Hub
echo "${DOCKER_HUB_TOKEN}" | docker login -u "${DOCKER_HUB_USERNAME}" --password-stdin

#Pull image in DockerHub
docker pull ${REPOSITORY}:${IMAGE_NAME}
    
# check if container exists or not
if [[ $(docker ps -qqa -f name="${CONTAINER_NAME}") ]] ; then 
  docker container stop flex && docker container rm flex
fi 
docker run -d -p ${PORTS} --name ${CONTAINER_NAME} ${REPOSITORY}:${IMAGE_NAME}

#remove
docker container prune -f 

#image
docker image prune -f


