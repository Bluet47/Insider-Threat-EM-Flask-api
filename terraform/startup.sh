#!/bin/bash
set -e  # stop on error

# Log to file
exec > /var/log/startup.log 2>&1

# Install Docker and Git
apt-get update
apt-get install -y docker.io git

# Clone your app
if [ ! -d "/employee-leaver-api" ]; then
  git clone https://github.com/Bluet47/employee-leaver-api.git
fi

cd employee-leaver-api

# Build and run the container
docker build -t employee-leaver-api .
docker run -d -p 80:8080 employee-leaver-api

