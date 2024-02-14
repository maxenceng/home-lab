#! /bin/bash

dir=/media

k3d cluster create selfhosted \
  -p 80:80@loadbalancer \
  -p 443:443@loadbalancer \
  -s 1 \
  -a 2 \
  --volume $dir:/media
