#!/bin/bash

# Fetch latest version
version=$(curl --silent https://api.github.com/repos/kubernetes-sigs/kind/releases/latest | jq -r '.name')

# Download and install
curl --location --silent --output ./kind https://kind.sigs.k8s.io/dl/${version}/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# Install and configure the cluster
kind version
kind create cluster --name kind --config ./kind-config.yaml

# Switch to the context
kubectl config use-context kind-kind