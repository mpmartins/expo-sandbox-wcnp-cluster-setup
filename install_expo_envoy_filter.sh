#!/bin/bash

echo "-> Installing Expo Envoy Filter Example..."
kubectl apply -f expo-envoy-filter/expo-envoy-filter.yaml --context=kind-kind
echo ""