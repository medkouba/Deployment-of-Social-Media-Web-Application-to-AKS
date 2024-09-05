#!/bin/bash
kubectl apply -f registry_key.yml

kubectl apply -f pv-azure.yml

kubectl apply -f mongo.yml
kubectl apply -f mongo-secret.yml

kubectl apply -f backend-config.yml
kubectl apply -f backend.yml

kubectl apply -f frontend-config.yml
kubectl apply -f frontend.yml

kubectl apply -f ssl-tls-cluster-issuer.yml
kubectl apply -f ssl-tls-ingress.yml