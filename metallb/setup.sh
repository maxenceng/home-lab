#!/bin/bash
kubectl create ns metallb
helm install metallb metallb/metallb -n metallb

sleep 10
kubectl apply -k metallb