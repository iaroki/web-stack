#!/bin/bash
sudo su -
apt update
apt install docker.io -y
echo 'Hello World' > /var/index.html
docker run -d --name nginx --restart always -p 80:80 -v /var/index.html:/usr/share/nginx/html/index.html nginx:1.22.1
