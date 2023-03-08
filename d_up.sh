# /bin/bash
docker container rm team2frontend
docker container rm team2data
docker container rm team2auth
docker network rm mccnetwork

docker network create mccnetwork --driver=bridge


docker run -d --name team2data --network mccnetwork -p 8080:8080 --expose 8080 --env API_HOST=team2auth:8081 --env DB_TYPE=hsqldb team2data:v1.0
docker run -d --name team2auth --network mccnetwork -p 8081:8081 --expose 8081 --env API_HOST=team2data:8080 team2auth:v1.0
docker run -d --name team2frontend --network mccnetwork -p 3000:80 --expose 80 --env REACT_APP_API_IP=team2data:8080 --env REACT_APP_AUTH_IP=team2auth:8081 team2frontend:v1.0

