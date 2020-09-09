#!/bin/bash

echo "-> Installing expo-echo-server on the cluster..."
kustomize build expo-echo-server | kubectl apply -f -
kubectl wait --for=condition=ready pod -l app=expo-echo-server -n experience-tools --timeout=480s;
echo ""