#/bin/bash
./docker_stop.sh
docker compose down
docker system prune -af
