sudo apt-get update
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo chown root:docker /var/run/docker.sock
sudo chmod a+w /var/run/docker.sock
DOCKER_HUB_USERNAME=$DOCKER_HUB_USERNAME
DOCKER_HUB_TOKEN=$DOCKER_HUB_TOKEN