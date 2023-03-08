#/bin/bash
./d_down.sh
./kube_down.sh
docker compose down
docker system prune -af
