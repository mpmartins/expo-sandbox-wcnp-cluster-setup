#!/bin/bash

echo "-> Installing Expo Envoy Filter..."
kustomize build expo-envoy-filter | kubectl apply -f -
echo ""
