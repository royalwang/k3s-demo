#!/bin/bash

# Install K3s
curl -sfL https://get.k3s.io | sh -

# Install Metrics Server
git clone https://github.com/kubernetes-incubator/metrics-server.git
kubectl apply -f metrics-server/deploy/1.8+/
kubectl top node

git clone https://github.com/hjacobs/kube-ops-view.git
kubectl apply -f kube-ops-view/deploy/

git clone https://codeberg.org/hjacobs/kube-web-view.git
kubectl apply -f kube-web-view/deploy/

git clone https://github.com/hjacobs/kube-resource-report.git
kubectl apply -f kube-resource-report/deploy/

kubectl apply -f manifests/
