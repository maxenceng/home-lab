#!/bin/bash
./config/helm.sh
./tailscale/setup.sh
./scripts/sed.sh
./rancher/setup.sh
./scripts/start.sh