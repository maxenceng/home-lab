#!/bin/bash
./config/helm.sh
./tailscale/setup.sh
./scripts/sed.sh
./rancher/setup.sh
./monitoring/setup.sh
kubectl apply -k config
kubectl config set-context --current --namespace=dev
kubectl apply -k postgres
./scripts/start.sh
