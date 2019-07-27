#!/bin/bash

# Install K3s
curl -sfL https://get.k3s.io | sh -

# Install Metrics Server
git clone https://github.com/kubernetes-incubator/metrics-server.git
kubectl apply -f metrics-server/deploy/1.8+/
kubectl top node

git clone https://github.com/hjacobs/kube-ops-view.git
kubectl apply -f kube-ops-view/deploy/
