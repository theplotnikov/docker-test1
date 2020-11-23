#!/bin/bash
docker build -t test1 .
docker run -d -p 80:8080 test1