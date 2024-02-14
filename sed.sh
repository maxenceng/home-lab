#!/bin/bash

source .env

provider=$(echo -n "$VPN_PROVIDER" | base64)
username=$(echo -n "$VPN_USERNAME" | base64)
password=$(echo -n "$VPN_PASSWORD" | base64)

sed -i "s/DOMAIN/$DOMAIN/g" common/values.yaml
sed -i "s/CF_ID/$CLOUDFLARE_ID/g" cloudflare/setup.sh
sed -i "s/CF_TOKEN/$CLOUDFLARE_TOKEN/g" cloudflare/setup.sh
sed -i "s/VPN_PROVIDER/$provider/g" config/gluetun-secret.yaml
sed -i "s/VPN_USERNAME/$username/g" config/gluetun-secret.yaml
sed -i "s/VPN_PASSWORD/$password/g" config/gluetun-secret.yaml
