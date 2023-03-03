#/bin/bash
docker build --tag team2data ./team2project/. &
docker build --tag team2auth ./team2project-auth/. &
docker build --tag front_end ./team2foxreactday6/. &
