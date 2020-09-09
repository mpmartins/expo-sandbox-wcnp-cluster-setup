#!/bin/bash

./install_istio.sh

sleep 10s 

./expose_istio_gateway.sh
./install_persistent_volume.sh

sleep 5s

./install_echo_server.sh

sleep 5s

./install_envoy_filter.sh
