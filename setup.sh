#!/bin/bash
# Maintained by https://cryptoandcoffee.com
# Cubic + Docker + Ubuntu 18
# Run this setup.sh in the chroot enviroment of Cubic to build
# Drag and Drop this file into the Cubic window then
# chmod +x setup.sh ; sudo ./setup.sh

echo "First, enable networking"
mkdir -p /run/systemd/resolve
ln -sr /var/run/resolvconf/resolv.conf /run/systemd/resolve/stub-resolv.conf

echo "System Upgrades"
sudo apt-get update && sudo apt-get dist-upgrade -yqq
sudo add-apt-repository universe
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    htop bmon jq ncdu glances bc iotop openssh-server ssh fail2ban build-essential 

echo "Docker Install"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER

echo "Docker-Compose Install"
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#Post-Install Commands
# sudo usermod -aG docker $USER
