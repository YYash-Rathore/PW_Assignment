#!/bin/bash

# Docker Assignment: Install Docker and containerize an application using Dockerfile

# Step 1: Install Docker (Ubuntu)
echo "Installing Docker..."
sudo apt update
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

# Step 2: Create a simple application (e.g., Python Flask App)
echo "Creating a simple Flask app and Dockerfile..."
mkdir flask-app
cd flask-app

cat <<EOF > app.py
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello from Flask inside Docker!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
EOF

cat <<EOF > requirements.txt
flask
EOF

cat <<EOF > Dockerfile
# Use official Python image
FROM python:3.9-slim

# Set work directory
WORKDIR /app

# Copy files
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .

# Run the application
CMD ["python", "app.py"]
EOF

# Step 3: Build Docker image
echo "Building Docker image..."
docker build -t flask-docker-app .

# Step 4: Run the container
echo "Running the container..."
docker run -d -p 5000:5000 flask-docker-app

echo "Flask app is running. Access it at: http://localhost:5000"
