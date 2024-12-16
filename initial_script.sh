sudo apt-get update
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo chown root:docker /var/run/docker.sock
sudo chmod a+w /var/run/docker.sock
gcloud storage cp gs://deploy-file/frontend-script/bash_test.sh .
chmod a+x *.sh
DOCKER_HUB_USERNAME=$DOCKER_HUB_USERNAME
DOCKER_HUB_TOKEN=$DOCKER_HUB_TOKEN
. bash_test.sh