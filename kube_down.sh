#/bin/bash


# Set terminal variables for minikube
eval $(minikube -p minikube docker-env)

kubectl delete deployment team2data team2auth team2frontend
kubectl delete service team2data team2auth team2frontend

