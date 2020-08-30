# expo-sandbox-wcnp-cluster-setup

This repository contains a set of bash scripts that use the following tools to setup a sandbox cluster to test expo envoy plugins.

You should be able to use brew to install the necessary tools:

```bash
▶ brew install kubernetes-cli istioctl
▶ brew cask install docker
```

Make sure to check the versions of your tools before starting. Here are the current versions I have installed:

```bash
▶ kubectl version
Client Version: version.Info{Major:"1", Minor:"16", GitVersion:"v1.16.2", GitCommit:"c97fe5036ef3df2967d086711e6c0c405941e14b", GitTreeState:"clean", BuildDate:"2019-10-15T23:43:08Z", GoVersion:"go1.12.10", Compiler:"gc", Platform:"darwin/amd64"}
Server Version: version.Info{Major:"1", Minor:"18", GitVersion:"v1.18.2", GitCommit:"52c56ce7a8272c798dbc29846288d7cd9fbae032", GitTreeState:"clean", BuildDate:"2020-04-30T20:19:45Z", GoVersion:"go1.13.9", Compiler:"gc", Platform:"linux/amd64"}
▶ istioctl version
client version: 1.6.5
control plane version: 1.6.5
data plane version: 1.6.5 (4 proxies)
▶ docker version
Client: Docker Engine - Community
 Version:           19.03.12
 API version:       1.40
 Go version:        go1.13.10
 Git commit:        48a66213fe
 Built:             Mon Jun 22 15:41:33 2020
 OS/Arch:           darwin/amd64
 Experimental:      false

Server: Docker Engine - Community
 Engine:
  Version:          19.03.12
  API version:      1.40 (minimum version 1.12)
  Go version:       go1.13.10
  Git commit:       48a66213fe
  Built:            Mon Jun 22 15:49:27 2020
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          v1.2.13
  GitCommit:        7ad184331fa3e55e52b890ea95e65ba581ae3429
 runc:
  Version:          1.0.0-rc10
  GitCommit:        dc9208a3303feef5b3839f4323d9beb36df0a9dd
 docker-init:
  Version:          0.18.0
  GitCommit:        fec3683
```

## Scripts

```bash
▶ ./install.sh
```

Sometimes I need to execute the istio installation script while disconnected from VPN to be able to download the images, but you should be fine if the images are already cached and there is no need to download them from the internet anymore.
