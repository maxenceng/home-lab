#!/bin/bash

helm repo add stable https://charts.helm.sh/stable
helm repo add metallb https://metallb.github.io/metallb
helm repo add strrl.dev https://helm.strrl.dev
helm repo add jetstack https://charts.jetstack.io
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
