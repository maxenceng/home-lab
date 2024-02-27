#!/bin/bash

kubectl patch svc argocd-server -n argocd --patch-file argocd/node-port.yaml --type merge