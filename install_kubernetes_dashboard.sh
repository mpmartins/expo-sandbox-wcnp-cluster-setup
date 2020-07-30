#!/bin/bash

echo "-> Installing kuberneters ui dashboard..."
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.3/aio/deploy/recommended.yaml --context kind-kind

echo "-> Creating admin user and extracting token..."
kubectl create clusterrolebinding default-admin --clusterrole cluster-admin --serviceaccount=default:default --context kind-kind
token=$(kubectl get secrets --context kind-kind -o jsonpath="{.items[?(@.metadata.annotations['kubernetes\.io/service-account\.name']=='default')].data.token}"|base64 --decode)
printf "%s\n" "$token"
#kubectl proxy
#open http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/overview?namespace=_all

