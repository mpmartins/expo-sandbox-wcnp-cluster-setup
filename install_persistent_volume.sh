#!/bin/bash

echo "-> Installing persistent volume..."
mkdir /tmp/envoy-filters
cp ./wasm/* /tmp/envoy-filters
kustomize build persistent-volume | kubectl apply -f -
echo ""
