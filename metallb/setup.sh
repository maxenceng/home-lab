#!/bin/bash
kubectl create ns metallb
helm upgrade --install metallb metallb/metallb -n metallb

sleep 10
kubectl apply -k metallb