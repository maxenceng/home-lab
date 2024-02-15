#!/bin/bash

helm repo add stable https://charts.helm.sh/stable
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
helm repo add tailscale https://pkgs.tailscale.com/helmcharts
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
