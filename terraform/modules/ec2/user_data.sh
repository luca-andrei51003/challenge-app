#!/bin/bash
dnf update -y
dnf install -y docker
systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user

# Run docker container mapping host port 80 to app port 5555
docker run -d --name web-server --restart always -p 80:5555 culceanluca/py-web:latest

