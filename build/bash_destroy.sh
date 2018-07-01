#!/bin/bash
docker stop docker_compose_docker_db_image_1
docker stop docker_compose_docker_web_image_1
docker rm docker_compose_docker_db_image_1
docker rm docker_compose_docker_web_image_1
docker rmi docker_compose_docker_db_image
docker rmi docker_compose_docker_web_image
docker rmi mysql:5.7
docker rmi php:7.0-apache
rm -Rf ./mysql
