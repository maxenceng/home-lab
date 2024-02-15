#!/bin/bash

helm upgrade --install tailscale-operator tailscale/tailscale-operator \
  -n tailscale --create-namespace \
  -f tailscale/values.yaml \
  --wait

kubectl apply -f tailscale/operator.yaml