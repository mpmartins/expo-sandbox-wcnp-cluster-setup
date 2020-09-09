#!/bin/bash

echo "-> Installing persistent volume..."
mkdir /tmp/wasm
cp ./wasm/* /tmp/wasm
kustomize build persistent-volume | kubectl apply -f -
echo ""
