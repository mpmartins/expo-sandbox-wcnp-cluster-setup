#!/bin/bash

echo "-> Installing istio with the demo profile to make sure all features are installed..."
kustomize build expose-istio-gateway | kubectl apply -f -
echo "-> Istio is ready"