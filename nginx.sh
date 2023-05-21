#!/bin/bash

cd ~
sudo yum install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo git clone https://github.com/dybran/Project-15.git
sudo cp https://github.com/dybran/Project-15.git/reverse.conf /etc/nginx/
sudo mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf_backup
cd /etc/nginx/
sudo touch nginx.conf
sudo sed -n 'w nginx.conf' reverse.conf
sudo systemctl restart nginx
sudo rm -rf reverse.conf