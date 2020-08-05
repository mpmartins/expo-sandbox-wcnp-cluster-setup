#!/bin/bash

echo "-> Installing expo-filter-provider on the cluster..."
istioctl kube-inject \
    --context=kind-kind \
    --namespace=experience-tools \
    --filename expo-filter-provider/expo-filter-provider.yaml \
    | kubectl apply -f -
echo ""

echo "Use the following command to hit expo-filter-provider:"
echo "curl http://localhost/filter"
echo ""