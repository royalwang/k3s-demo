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

git clone https://github.com/hjacobs/kube-ops-view.git
kubectl apply -f kube-ops-view/deploy/

git clone https://codeberg.org/hjacobs/kube-web-view.git
kubectl apply -f kube-web-view/deploy/

git clone https://github.com/hjacobs/kube-resource-report.git
kubectl apply -f kube-resource-report/deploy/

kubectl apply -f manifests/
