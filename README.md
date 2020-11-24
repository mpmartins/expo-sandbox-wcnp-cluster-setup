# expo-sandbox-wcnp-cluster-setup

This repository contains a set of bash scripts that use the following tools to setup a sandbox cluster to test expo envoy plugins.

You should be able to use brew to install most of the necessary tools:

```bash
▶ brew install kubernetes-cli kustomize
▶ brew cask install docker
```

For istio, use the istio install procedure to control the version you want to download:
```bash
▶ curl -L https://istio.io/downloadIstio | sh -
```


Make sure to check the versions of your tools before starting. Here are the current versions I have installed:

```bash
▶ kubectl version
Client Version: version.Info{Major:"1", Minor:"19", GitVersion:"v1.19.2", GitCommit:"f5743093fd1c663cb0cbc89748f730662345d44d", GitTreeState:"clean", BuildDate:"2020-09-16T21:51:49Z", GoVersion:"go1.15.2", Compiler:"gc", Platform:"darwin/amd64"}
Server Version: version.Info{Major:"1", Minor:"19", GitVersion:"v1.19.3", GitCommit:"1e11e4a2108024935ecfcb2912226cedeafd99df", GitTreeState:"clean", BuildDate:"2020-10-14T12:41:49Z", GoVersion:"go1.15.2", Compiler:"gc", Platform:"linux/amd64"}

▶ istioctl version
client version: 1.8.0
control plane version: 1.8.0
data plane version: 1.8.0 (2 proxies)

▶ docker version
Client: Docker Engine - Community
 Cloud integration: 1.0.2
 Version:           19.03.13
 API version:       1.40
 Go version:        go1.13.15
 Git commit:        4484c46d9d
 Built:             Wed Sep 16 16:58:31 2020
 OS/Arch:           darwin/amd64
 Experimental:      false

Server: Docker Engine - Community
 Engine:
  Version:          19.03.13
  API version:      1.40 (minimum version 1.12)
  Go version:       go1.13.15
  Git commit:       4484c46d9d
  Built:            Wed Sep 16 17:07:04 2020
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          v1.3.7
  GitCommit:        8fba4e9a7d01810a393d5d25a3621dc101981175
 runc:
  Version:          1.0.0-rc10
  GitCommit:        dc9208a3303feef5b3839f4323d9beb36df0a9dd
 docker-init:
  Version:          0.18.0
  GitCommit:        fec3683
```

## Scripts

There is a install.sh script to execute all other scripts in order, but for debugging, it is better to run them one by one:

```bash
1. ./install_istio.sh

2. ./expose_istio_gateway.sh
3. ./install_persistent_volume.sh

4. ./install_echo_server.sh

5. ./install_envoy_filter.sh
```

NOTE1: Sometimes I need to execute the istio installation script while disconnected from VPN to be able to download the images, but you should be fine if the images are already cached and there is no need to download them from the internet anymore.

NOTE2: Make sure you reset the Kubernetes cluster on the Docker app before running the scripts
In care Kubernetes cluster is not working, use the following steps to clear it all up:
```
1. Stop Docker desktop app.
2. rm -rf ~/Library/Group\ Containers/group.com.docker/pki/
3. rm -rf ~/.kube
4. docker system prune
5. Restart Docker desktop app
6. Reset Kubernetes cluster on the Docker app settings.
```

NOTE3: IstioOperator might take some time to install the istio control plane (istiod). Make sure the `kubectl get crd` shows the `gateways.networking.istio.io` crd before you continue to script 2.
