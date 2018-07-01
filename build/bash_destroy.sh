#!/bin/bash
docker stop docker_compose_docker_db_image
docker stop docker_compose_docker_web_image
docker rm docker_compose_docker_db_image
docker rm docker_compose_docker_web_image
rm -Rf ./mysql
