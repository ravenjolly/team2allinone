#/bin/bash
docker build --tag team2data:v1.0 ./team2project/. &
docker build --tag team2auth:v1.0 ./team2project-auth/. &
docker build --tag team2frontend:v1.0 ./team2foxreactday6/. 
