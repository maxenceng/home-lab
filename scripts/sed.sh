#!/bin/bash

source .env

vpn_provider=$(echo -n "$VPN_PROVIDER" | base64)
vpn_username=$(echo -n "$VPN_USERNAME" | base64)
vpn_password=$(echo -n "$VPN_PASSWORD" | base64)

sed -i "s/VPN_PROVIDER/$vpn_provider/g" config/gluetun-secret.yaml
sed -i "s/VPN_USERNAME/$vpn_username/g" config/gluetun-secret.yaml
sed -i "s/VPN_PASSWORD/$vpn_password/g" config/gluetun-secret.yaml

sed -i "s/TS_ID/$TS_ID/g" tailscale/operator.yaml
sed -i "s/TS_SECRET/$TS_SECRET/g" tailscale/operator.yaml
sed -i "s/TS_ID/$TS_ID/g" tailscale/values.yaml
sed -i "s/TS_SECRET/$TS_SECRET/g" tailscale/values.yaml
