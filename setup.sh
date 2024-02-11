#! /bin/bash

dir=/media

mkdir $dir
chown -R 1000:1000 $dir
chmod -R 777 $dir

## RESTART REGISTRY WITH CUSTOM CONFIG
k3d registry create registry.localhost --port 12345
k3d cluster create selfhosted \
  -p 80:80@loadbalancer \
  -p 443:443@loadbalancer \
  -s 1 \
  -a 2 \
  --registry-use k3d-registry.localhost:12345 \
  --volume $dir:/media
