#!/bin/bash

echo "-> Creating experience-tools namespace on the cluster with istio-injection enabled..."
kubectl create namespace experience-tools --context=kind-kind
kubectl label namespace experience-tools istio-injection=enabled --context=kind-kind
echo ""

echo "-> Installing expo-echo-server on the cluster..."
kubectl -n istio-system get configmap istio-sidecar-injector -o=jsonpath='{.data.config}' > generated/inject-config.yaml
kubectl -n istio-system get configmap istio-sidecar-injector -o=jsonpath='{.data.values}' > generated/inject-values.yaml
kubectl -n istio-system get configmap istio -o=jsonpath='{.data.mesh}' > generated/mesh-config.yaml
istioctl kube-inject \
    --context=kind-kind \
    --namespace=experience-tools \
    --injectConfigFile generated/inject-config.yaml \
    --meshConfigFile generated/mesh-config.yaml \
    --valuesFile generated/inject-values.yaml \
    --filename expo-echo-server/expo-echo-server.yaml \
    | kubectl apply -f -
echo ""

echo "Use the following command to hit expo-echo-server:"
echo "curl http://localhost/echo"
echo ""