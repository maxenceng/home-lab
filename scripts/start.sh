#! /bin/zsh

helm upgrade --install sonarr common -f sonarr/values.yaml
helm upgrade --install radarr common -f radarr/values.yaml
helm upgrade --install flaresolverr common -f flaresolverr/values.yaml
helm upgrade --install prowlarr common -f prowlarr/values.yaml
helm upgrade --install jellyfin common -f jellyfin/values.yaml
helm upgrade --install jellyseerr common -f jellyseerr/values.yaml
helm upgrade --install transmission common -f transmission/values.yaml
helm upgrade --install homepage common -f homepage/values.yaml
helm upgrade --install cloudbeaver common -f cloudbeaver/values.yaml
