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
# DOCKER_HUB_USERNAME=$DOCKER_HUB_USERNAME
# DOCKER_HUB_TOKEN=$DOCKER_HUB_TOKEN
. bash_test.sh