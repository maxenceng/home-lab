#!/bin/bash

helm upgrade --install --wait \
  -n cloudflare-tunnel-ingress-controller --create-namespace \
  cloudflare-tunnel-ingress-controller \
  strrl.dev/cloudflare-tunnel-ingress-controller \
  --set=cloudflare.apiToken="CF_TOKEN",cloudflare.accountId="CF_ID",cloudflare.tunnelName="homelab"
