#!/bin/bash

echo "-> Adding gateway configuration..."
kustomize build expose-istio-gateway | kubectl apply -f -
echo "-> Istio is ready"