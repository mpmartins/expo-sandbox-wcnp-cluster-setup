#!/bin/bash

echo "-> Installing expo-echo-server on the cluster..."
kustomize build expo-echo-server | kubectl apply -f -
echo ""