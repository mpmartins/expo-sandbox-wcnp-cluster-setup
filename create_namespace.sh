#!/bin/bash

echo "-> Creating experience-tools namespace on the cluster with istio-injection enabled..."
kubectl create namespace experience-tools --context=kind-kind
#kubectl label namespace experience-tools istio-injection=enabled --context=kind-kind
echo ""
