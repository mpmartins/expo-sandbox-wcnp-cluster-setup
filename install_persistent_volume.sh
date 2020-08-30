#!/bin/bash

echo "-> Installing persistent volume..."
kustomize build persistent-volume | kubectl apply -f -
echo ""
