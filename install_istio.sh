#!/bin/bash

echo "-> Installing Istio operator..."
istioctl operator init
kubectl wait --for=condition=ready pod -l name=istio-operator -n istio-operator --timeout=480s;

echo "-> Installing Istio profile..."
kustomize build install-istio | kubectl apply -f -
kubectl wait --for=condition=ready pod -l app=istiod -n istio-system --timeout=480s;
echo "-> Istio is ready"