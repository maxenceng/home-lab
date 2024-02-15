#!/bin/bash
./config/helm.sh
./scripts/sed.sh
./metallb/setup.sh
./cert-manager/setup.sh
./rancher/setup.sh
./cloudflare/setup.sh
./scripts/start.sh