#!/bin/bash
./config/helm.sh
./scripts/sed.sh
./metallb/setup.sh
./cloudflare/setup.sh
./scripts/start.sh