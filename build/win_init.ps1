./win_destroy.ps1
git pull
mv ../www docker_compose/
cd docker_compose
docker-compose up --build --force-recreate -d