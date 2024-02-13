#!/bin/bash

source .env


sed -i "s/DOMAIN/$DOMAIN/g" common/values.yaml
sed -i "s/CF_ID/$CLOUDFLARE_ID/g" cloudflare/setup.sh
sed -i "s/CF_TOKEN/$CLOUDFLARE_TOKEN/g" cloudflare/setup.sh
