docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker volume prune --force
docker system prune --force
docker network prune --force
rm -rf crypto-config
