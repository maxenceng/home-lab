#! /bin/zsh

kubectl apply -k config
helm upgrade --install traefik traefik/traefik
kubectl apply -k traefik
kubectl config set-context --current --namespace=dev
helm upgrade --install sonarr common -f sonarr/values.yaml
helm upgrade --install radarr common -f radarr/values.yaml
helm upgrade --install flaresolverr common -f flaresolverr/values.yaml
helm upgrade --install prowlarr common -f prowlarr/values.yaml
helm upgrade --install jellyfin common -f jellyfin/values.yaml
helm upgrade --install jellyseerr common -f jellyseerr/values.yaml
helm upgrade --install transmission common -f transmission/values.yaml
helm upgrade --install homarr common -f homarr/values.yaml