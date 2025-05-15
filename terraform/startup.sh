#!/bin/bash
apt update
apt install -y docker.io git
git clone https://github.com/Bluet47/employee-leaver-api.git
cd employee-leaver-api
docker build -t employee-leaver-api .
docker run -d -p 80:8080 employee-leaver-api
