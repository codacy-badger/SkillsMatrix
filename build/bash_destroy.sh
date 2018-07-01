#!/bin/bash
docker stop docker_compose_docker_db_image_1
docker stop docker_compose_docker_web_image_1
docker rm docker_compose_docker_db_image_1
docker rm docker_compose_docker_web_image_1
docker rmi docker_compose_docker_db_image
docker rmi docker_compose_docker_web_image
docker rmi mysql
docker rmi php
rm -Rf ./mysql
