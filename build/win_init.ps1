./destroy.ps1
mkdir mysql
git pull
cd docker_compose && docker-compose up --build --force-recreate -d