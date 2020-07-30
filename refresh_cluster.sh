#!/bin/bash

echo "-> Cleanup..."
rm -Rf generated
mkdir generated
kind delete cluster
echo ""

echo "-> Refreshing kind cluster..."
kind create cluster --config kind/kind-cluster-config.yaml
echo ""

echo "-> Installing istio with the demo profile to make sure all features are installed..."
istioctl manifest generate --set profile=demo > generated/istio_manifest.yaml
istioctl install --set profile=demo --context kind-kind
kubectl patch service istio-ingressgateway --context kind-kind -n istio-system --patch "$(cat istio/patch-ingressgateway-nodeport.yaml)"
echo ""

echo "-> Extracting nodeport values from istio configs..."
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].nodePort}')
export TCP_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="tcp")].nodePort}')
echo ""

echo "-> Setting ingreess host to 12.0.0.1 assuming you are using docker desktop..."
export INGRESS_HOST=127.0.0.1
export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT
echo ""

echo "-> Cluster is ready"