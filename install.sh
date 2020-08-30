#!/bin/bash

./install_istio.sh

./expose_istio_gateway.sh

./install_persistent_volume.sh

./install_echo_server.sh

./install_envoy_filter.sh
