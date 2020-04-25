#!/bin/bash

# Install K3s
curl -sfL https://get.k3s.io | sh -

# Install Metrics Server
git clone https://github.com/kubernetes-incubator/metrics-server.git
kubectl apply -f metrics-server/deploy/1.8+/
kubectl top node

sudo mkdir /opt/local-path-provisioner
kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/deploy/local-path-storage.yaml
kubectl patch storageclass local-path -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'

kubectl apply -k manifests/
