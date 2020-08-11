#!/bin/bash

echo "-> Installing Expo Envoy Filter Example..."
kubectl apply -f expo-envoy-filter/expo-envoy-filter.yaml --context=kind-kind
echo ""

## Instalation based on https://istio.io/latest/docs/reference/config/networking/envoy-filter/
# and also using the remote fetch option 

## Other alternatives to deploy WASM filters:
#
# 1. Using WASME:
#    https://istio.io/latest/blog/2020/deploy-wasm-declarative/
#    https://docs.solo.io/web-assembly-hub/latest/tutorial_code/getting_started/
#
# 2. Adding a volume mount to istio-proxy containers and use a local reference:
#    Some comments from Robert Panzer:
#    These annotations on the pod should make the istio-injector add a volume and a volume mount to the istio-proxy container:
#        sidecar.istio.io/userVolume: '[{"name":"wasm-cm","configMap":{"name":"wasm-bundle","items":[{"key":"bundle.wasm","value":"bundle.wasm"}]}}]'
#        sidecar.istio.io/userVolumeMount: '[{"name":"wasm-cm","mountPath":"/wasm-bundle","readOnly":true}]'
#    Something like that. The content of the annotations mirrors directly how a volume and mount from a config map are defined here: https://kubernetes.io/docs/concepts/storage/volumes/#configmap (edited) 
#    This document is probably better: https://kubernetes.io/docs/concepts/configuration/configmap/
#    And here is a sample for how to create a config map: https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/#create-configmaps-from-directories
#          kubectl create configmap -n istio-system wasm-bundle --from-file=bundle.wasm
#    (There might be some inconsistencies because I didn’t try it out now, but that should definitely work to get the wasm bundle available locally in the proxy’s filesystem) (

