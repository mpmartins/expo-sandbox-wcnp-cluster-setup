#!/bin/bash

echo "-> Cleanup..."
rm -Rf generated
mkdir generated

kind delete cluster
echo ""