#!/bin/bash
apt-get update
apt-get install -y docker.io git

# Clone your GitHub repo
git clone https://github.com/Bluet47/employee-leaver-api.git
cd employee-leaver-api

# Build and run the Docker container
docker build -t employee-leaver-api .
docker run -d -p 80:8080 employee-leaver-api
