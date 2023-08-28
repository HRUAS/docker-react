#!/bin/sh
sudo docker compose down

sudo yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine -y
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo systemctl start docker
sudo yum install docker-compose-plugin

################### creating folder for jenkins
mkdir -p /home/$USER/jenkins_compose/jenkins_configuration

################### Running docker compose to create all the required containers
sudo docker compose up --build