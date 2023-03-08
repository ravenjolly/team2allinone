


eval $(minikube -p minikube docker-env)
kubectl create namespace logging
kubectl create -f kubernetes_logging/elastic.yaml  -n logging
kubectl create -f kubernetes_logging/kibana.yaml  -n logging
kubectl apply -f kubernetes_logging/fluentd-rbac.yaml
kubectl apply -f kubernetes_logging/fluentd-daemonset.yaml
