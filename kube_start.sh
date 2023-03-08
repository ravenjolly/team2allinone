#/bin/bash

# Set terminal variables for minikube
eval $(minikube -p minikube docker-env)

# Load in built images
minikube image load team2data:v1.0
minikube image load team2auth:v1.0
minikube image load team2frontend:v1.0

# deploy applications
kubectl create deployment team2data --image team2data:v1.0
kubectl create deployment team2auth --image team2auth:v1.0
kubectl create deployment team2frontend --image team2frontend:v1.0

kubectl expose deployment team2data --type=LoadBalancer --port=8080
kubectl expose deployment team2auth --type=LoadBalancer --port=8081
kubectl expose deployment team2frontend --type=LoadBalancer --port=80

kubectl set env deployment/team2data API_HOST=team2auth:8081
kubectl set env deployment/team2auth API_HOST=team2data:8080

kubectl set env deployment/team2frontend REACT_APP_AUTH_IP=team2auth:8081
kubectl set env deployment/team2frontend REACT_APP_API_IP=team2data:8080
