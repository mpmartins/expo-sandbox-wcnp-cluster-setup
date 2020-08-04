#!/bin/bash

echo "-> Cleanup..."
rm -Rf generated
mkdir generated
kind delete cluster
echo ""

echo "-> Refreshing kind cluster..."
kind create cluster --config kind/kind-cluster-config.yaml
echo ""

echo "-> Cluster is ready"