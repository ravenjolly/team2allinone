#/bin/bash
docker build --tag k8s_team2data ./team2project/. &
docker build --tag k8s_team2auth ./team2project-auth/. &
docker build --tag k8s_team2front_end ./team2foxreactday6/. &
