#!/usr/bin/bash
kubectl create namespace prometheus
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm upgrade -i prometheus prometheus-community/prometheus \
    --namespace prometheus \
    --set alertmanager.persistentVolume.storageClass="gp2",server.persistentVolume.storageClass="gp2"

for i in {1..7}; do kubectl get pods -n prometheus; sleep 7; ((i++)); done

kubectl --namespace=prometheus port-forward deploy/prometheus-server 9090
curl -L http://localhost:9090