#!/bin/bash
kubectl apply -f ssl-tls-ingress.yml
kubectl apply -f ssl-tls-cluster-issuer.yml

kubectl delete -f frontend.yml
kubectl delete -f frontend-config.yml

kubectl delete -f backend.yml
kubectl delete -f backend-config.yml

kubectl delete -f mongo.yml
kubectl delete -f mongo-secret.yml

kubectl delete -f pv-azure.yml

kubectl delete -f registry_key.yml

