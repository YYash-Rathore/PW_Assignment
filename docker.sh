#!/bin/bash

# Docker Fundamentals Assignment
echo "Using Docker Compose to define and run multi-container applications"

# Step 1: Create a sample Docker Compose YAML file
cat <<EOF > docker-compose.yml
version: '3'
services:
  web:
    image: nginx
    ports:
      - "8080:80"
  app:
    image: busybox
    command: tail -f /dev/null
EOF

echo "docker-compose.yml file created with a web (nginx) and app (busybox) container."

# Step 2: Start the multi-container application
echo "Running docker-compose..."
docker-compose up -d

echo "Multi-container application is now running."
echo "Access the NGINX web server at: http://localhost:8080"
