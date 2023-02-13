#!/bin/bash
yum update -y
hostnamectl set-hostname XxXxXx
yum install git -y
mkdir /var/log/arf
touch /var/log/arf/go.log 
chmod 777 /var/log/arf/go.log
wget https://go.dev/dl/go1.17.6.linux-amd64.tar.gz
rm -rf /usr/local/go 
tar -C /usr/local -xzf go1.17.6.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> /home/ec2-user/.bashrc 
echo 'export GOVERSION=go1.17.1' >> /home/ec2-user/.bashrc 
echo 'export GO_INSTALL_DIR=/usr/local/go' >> /home/ec2-user/.bashrc 
echo 'export GOROOT=$GO_INSTALL_DIR' >> /home/ec2-user/.bashrc 
echo 'export GOPATH=/home/ec2-user/golang' >> /home/ec2-user/.bashrc 
echo 'export PATH=$GOROOT/bin:$GOPATH/bin:$PATH' >> /home/ec2-user/.bashrc 
echo 'export GO111MODULE="on"' >> /home/ec2-user/.bashrc 
echo 'export GOSUMDB=off' >> /home/ec2-user/.bashrc 


