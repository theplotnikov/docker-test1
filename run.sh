#!/bin/bash
cd /root
git clone https://github.com/theplotnikov/docker-test1.git
cd docker-test1
docker build -t test1 .
docker run -d -p 80:80 test1