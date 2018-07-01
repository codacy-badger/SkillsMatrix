#!/bin/bash
./bash_destroy.sh
git pull
cd docker_compose && docker-compose up --build --force-recreate -d