#!/bin/bash
./config/helm.sh
./sed.sh
./metallb/setup.sh
./cloudflare/setup.sh
./start.sh