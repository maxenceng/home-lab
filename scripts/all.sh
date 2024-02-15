#!/bin/bash
./config/helm.sh
./tailscale/setup.sh
./scripts/sed.sh
./rancher/setup.sh
./monitoring/setup.sh
./scripts/start.sh