#!/bin/bash
# docker stop and prune all running containers
docker ps -a > current-stopp.txt
cat current-stopp.txt | cut -c 1-15 > current-stop.txt
tail -n +2 current-stop.txt > docker-stop.txt
sed 's/^/docker stop /' docker-stop.txt > docker-stop-current.txt
chmod +x docker-stop-current.txt 
./docker-stop-current.txt 
docker container prune -f
rm -rf current-stopp.txt  current-stop.txt  docker-stop-current.txt  docker-stop.txt

