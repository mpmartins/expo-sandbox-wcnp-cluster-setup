#!/bin/bash

echo "-> Refreshing kind cluster..."
kind create cluster --config kind/kind-cluster-config.yaml
echo ""

echo "-> Cluster is ready"