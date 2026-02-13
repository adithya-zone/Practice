#!/bin/bash
yum update -y
yum install httpd -y
systemctl enable httpd
systemctl start httpd
echo "<h1>Welcome to Live AWS Project using Shell Script</h1>" > /var/www/html/index.html
