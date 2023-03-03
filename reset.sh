#/bin/bash
./stop_containers.sh
docker compose down
docker system prune -af
