
#!/bin/bash

echo "-> Unintalling all services and pods from experience-tools namespace..."
kubectl -n experience-tools delete pod,svc --all --context=kind-kind
echo ""