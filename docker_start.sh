# /bin/bash
docker container rm docker_team2front_end
docker container rm docker_team2data
docker container rm docker_team2auth
docker network rm docker_mccnetwork
docker network create docker_mccnetwork --driver=bridge --subnet 172.20.0.0/24



docker run -d --name docker_team2data -p 8080:8080 --expose 8080 --env API_HOST=docker_team2auth:8081 docker_team2data --env DB_TYPE=hsqldb
docker run -d --name docker_team2auth -p 8081:8081 --expose 8081 --env API_HOST=docker_team2data:8080 docker_team2auth
docker network connect docker_mccnetwork docker_team2data
docker network connect docker_mccnetwork docker_team2auth


docker run -d --network docker_mccnetwork --name docker_team2front_end -p 3000:80 --env REACT_APP_API_IP=docker_team2data:8080 --env REACT_APP_AUTH_IP=docker_team2auth:8081 docker_team2front_end

#docker network connect docker_mccnetwork docker_team2front_end
