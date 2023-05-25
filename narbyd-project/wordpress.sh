#!/bin/bash

#mount wordpress acces point
mkdir /var/www/
sudo mount -t efs -o tls,accesspoint=fsap-075d969a83a54d104 fs-039addedc443b6916:/ /var/www/

#Install httpd
yum install -y httpd 
systemctl start httpd
systemctl enable httpd

#install dependencies
yum module reset php -y
yum module enable php:remi-7.4 -y
yum install php php-common php-mbstring php-opcache php-intl php-xml php-gd php-curl php-mysqlnd php-fpm php-json -y
systemctl start php-fpm
systemctl enable php-fpm

#download wordpress
wget http://wordpress.org/latest.tar.gz

#setup wordpress
tar xzvf latest.tar.gz
rm -rf latest.tar.gz
cp wordpress/wp-config-sample.php wordpress/wp-config.php
mkdir /var/www/html/
cp -R /wordpress/* /var/www/html/

#create healthstatus file
cd /var/www/html/
touch healthstatus

#changing the localhost to RDS endpoint
sed -i "s/localhost/narbyd-database.cwndedhlcmgg.us-east-1.rds.amazonaws.com/g" wp-config.php

#set up the username and password for the RDS 
sed -i "s/username_here/narbyd/g" wp-config.php 
sed -i "s/password_here/sa4la2xa/g" wp-config.php 
sed -i "s/database_name_here/wordpressdb/g" wp-config.php 
chcon -t httpd_sys_rw_content_t /var/www/html/ -R
systemctl restart httpd