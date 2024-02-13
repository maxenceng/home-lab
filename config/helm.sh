#!/bin/bash

helm repo add stable https://charts.helm.sh/stable
helm repo add metallb https://metallb.github.io/metallb
helm repo add strrl.dev https://helm.strrl.dev
helm repo update
