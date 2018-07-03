#!/bin/bash
./bash_destroy.sh
mv ../www docker_compose/
git pull
cd docker_compose && docker-compose up --build --force-recreate -d