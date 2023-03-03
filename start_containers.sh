# /bin/bash
docker container rm front_end
docker container rm team2data
docker container rm team2auth
docker network rm mccnetwork
docker network create mccnetwork --driver=bridge --subnet 172.20.0.0/24
docker run -d --name team2data -p 8080:8080 --expose 8080 --env API_HOST=team2auth:8081 team2data
#docker run -d --name team2data --expose 8080 --env API_HOST=team2auth:8081 team2project 
docker run -d --name team2auth -p 8081:8081 --expose 8081 --env API_HOST=team2data:8080 team2auth 
#docker run -d --name team2auth --expose 8081 --env API_HOST=team2data:8080 team2auth 
docker run -d --name front_end -p 3000:80 front_end 

docker network connect mccnetwork team2data
docker network connect mccnetwork team2auth
docker network connect mccnetwork front_end
