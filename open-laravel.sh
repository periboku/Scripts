#!/bin/bash

echo "Load EPEL Repo"
amazon-linux-extras install epel -y

echo "Update System"
yum update -y

echo "Renaming System"
hostnamectl set-hostname php_ready

echo "Installing Nginx"
amazon-linux-extras install nginx1 -y 

echo "Installing Php 8.0"
amazon-linux-extras enable php8.0 

yum clean metadata 

yum install php php-cli php-mysqlnd php-pdo php-common php-fpm -y 
yum install php-gd php-mbstring php-xml php-dom php-intl php-simplexml -y 

echo "Enabling Nginx Service"
systemctl start nginx 
systemctl enable nginx 

echo "Installing Git"
yum install git -y

echo "Install nginx GeoIP Module"
mkdir /etc/nginx/sites-enabled
yum install GeoIP GeoIP-devel GeoIP-data -y
yum install nginx-mod-http-geoip -y

echo "Install and start supervisor"
yum install supervisor -y
systemctl start supervisord.service

echo "Added Virtual Hosts Path to Nginx"
sed -i '/octet-stream;/ a\ include /etc/nginx/sites-enabled/*.conf;' /etc/nginx/nginx.conf
echo "Install Composer Package"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/bin/composer

echo "Create Log Directory"
mkdir /var/log/
chmod -R 777 /var/log/
echo "Create Codebase Directory"
echo "/var/www/current && /var/www/environment"
mkdir /var/www/current
mkdir /var/www/environment

rm -rf /var/www/html
rm -rf /var/www/cgi-bin
