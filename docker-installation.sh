#!/bin/bash

sudo apt-get -y update
wait $!
sleep 0.5
sudo apt-get install -y ca-certificates
wait $!
sleep 0.5
sudo apt-get install -y curl
wait $!
sleep 0.5
sudo apt-get install -y gnupg
wait $!
sleep 0.5
sudo apt-get install -y lsb-release
wait $!
sleep 0.5
sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg


echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get -y update
wait $!
sleep 0.5
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
wait $!
sleep 0.5
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "Installation finished"

