#!/bin/bash
yum update -y
hostnamectl set-hostname treasury-api-prod
sudo yum install git -y
curl --silent --location https://rpm.nodesource.com/setup_14.x | sudo bash -
sudo yum install -y nodejs
sudo npm install pm2@latest -g
