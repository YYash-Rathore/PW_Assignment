#!/bin/bash

# Docker Assignment - 1
echo "Docker Assignment 1: Pull Ubuntu container and install Apache2"

echo "Pulling Ubuntu image..."
docker pull ubuntu

echo "Running Ubuntu container and mapping port 80..."
docker run -dit --name apache-container -p 80:80 ubuntu

echo "Installing Apache2 inside the container..."
docker exec -it apache-container apt update
docker exec -it apache-container apt install apache2 -y
docker exec -it apache-container service apache2 start

echo "Apache2 should now be accessible at http://localhost"

# Docker Assignment - 2
echo "Docker Assignment 2: Save image and run on port 81"

echo "Committing container to new image..."
docker commit apache-container ubuntu-apache

echo "Running new container from saved image on port 81..."
docker run -dit --name apache-container-81 -p 81:80 ubuntu-apache

echo "Starting Apache2 in the new container..."
docker exec -it apache-container-81 service apache2 start

echo "Check browser at http://localhost:81"

# Docker Assignment - 3
echo "Docker Assignment 3: Upload image to Docker Hub and run on another machine"

echo "Tagging the image for Docker Hub (replace 'yourusername' with your Docker ID)..."
docker tag ubuntu-apache yourusername/ubuntu-apache

echo "Logging in to Docker Hub..."
docker login

echo "Pushing image to Docker Hub..."
docker push yourusername/ubuntu-apache

echo "On another machine, pull and run the image..."
echo "docker pull yourusername/ubuntu-apache"
echo "docker run -dit --name apache-container-new -p 80:80 yourusername/ubuntu-apache"
echo "docker exec -it apache-container-new service apache2 start"

echo "Apache2 should now be accessible at http://<other-machine-ip>"
