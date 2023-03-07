#/bin/bash
docker build --tag docker_team2data ./team2project/. &
docker build --tag docker_team2auth ./team2project-auth/. &
docker build --tag docker_team2front_end ./team2foxreactday6/. &
