#! /bin/zsh

helm uninstall sonarr
helm uninstall radarr
helm uninstall flaresolverr
helm uninstall prowlarr
helm uninstall jellyfin
helm uninstall jellyseerr
helm uninstall transmission
helm uninstall homepage
helm uninstall cloudbeaver
kubectl delete -k postgres