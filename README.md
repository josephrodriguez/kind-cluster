# kind-cluster

A simple way to quickly install a Kubernetes cluster using [kind](https://kind.sigs.k8s.io/ ) running the nodes as Docker containers.

This environment is intended and recommended for development and testing purposes only.

## Configuration

The cluster configuration defined in the `kind-config.yaml` file is set to create one master node and three worker nodes.

```
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
- role: worker
- role: worker
- role: worker
```

To enable a highly availability (HA) topology on the Kubernetes cluster you just need to add another `control-plane` role in the configuration.

```
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
- role: control-plane
- role: worker
- role: worker
- role: worker
```

## Installation

The script automatically fetches and install the latest release of [kind](https://github.com/kubernetes-sigs/kind/releases). 

```sh
git clone https://github.com/josephrodriguez/kind-cluster.git
cd kind-cluster/
chmod 700 ./kind-init.sh && ./kind-init.sh
```

This is an example of the install process output.

```
kind v0.15.0 go1.19 linux/amd64
Creating cluster "kind" ...
 â Ensuring node image (kindest/node:v1.25.0) đŧ
 â Preparing nodes đĻ đĻ đĻ đĻ
 â Writing configuration đ
 â Starting control-plane đšī¸
 â Installing CNI đ
 â Installing StorageClass đž
 â Joining worker nodes đ
Set kubectl context to "kind-kind"
You can now use your cluster with:

kubectl cluster-info --context kind-kind

Not sure what to do next? đ  Check out https://kind.sigs.k8s.io/docs/user/quick-start/
Switched to context "kind-kind".
```

At this point you have the Kubernetes cluster ready to use.