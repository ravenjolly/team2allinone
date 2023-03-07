#/bin/bash

kubectl create deployment k8s_team2data --image team2data
kubectl create deployment k8s_team2auth --image team2auth
kubectl create deployment k8s_team2front_end --image front_end

kubectl expose deployment k8s_team2data --type=LoadBalancer --port=8080
kubectl expose deployment k8s_team2auth --type=LoadBalancer --port=8081
kubectl expose deployment k8s_team2front_end --type=LoadBalancer --port=80

kubectl set env deployment/k8s_team2data API_HOST=k8s_team2auth:8081
kubectl set env deployment/k8s_team2auth API_HOST=k8s_team2auth:8080

