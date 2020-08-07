#!/bin/bash

read -p "Are you sure you want to recreate the cluster? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
   
    ./cleanup.sh

    ./create_cluster.sh

    ##./install_kubernetes_dashboard.sh

    ./install_istio.sh

    ./create_namespace.sh

    ./install_echo_server.sh

    ./install_filter_provider.sh

    ./install_envoy_filter.sh

fi
