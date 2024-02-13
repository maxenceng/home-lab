# Home Lab

Project based on [k3s](https://k3s.io/) to host selfhosted apps to manage tv shows and movies.

## Applications

[Homarr](https://github.com/ajnart/homarr): Application dashboard

[Prowlarr](https://github.com/Prowlarr/Prowlarr): Torrent indexer

[Flaresolverr](https://github.com/FlareSolverr/FlareSolverr): Bypass Cloudflare and DDoS-GUARD protection. Solely used by Prowlarr

[Sonarr](https://github.com/Sonarr/sonarr): Queues TV shows requests and processes them when completed

[Radarr](https://github.com/Radarr/radarr): Same as Sonarr but for movies

[Transmission](https://github.com/transmission/transmission): Torrent downloader

[Jellyfin](https://github.com/jellyfin/jellyfin): Library manager and media system for your video files

[Jellyseerr](https://github.com/Fallenbagel/jellyseerr): Displays popular movies and tv shows you can request

This project contains [k3d](https://k3d.io/v5.6.0/) scripts to test this project and k3s to deploy it with cloudflare on a private server in your home.

## How to use

### Prerequisites

- If you want to use k3d and start it on your own computer, [install it beforehand](https://k3d.io/v5.6.0/#releases)
- In order to use this project in its full intent, you need to have a domain name registered and a cloudflare account configured following the requirements for the [ingress-controller used.](https://github.com/STRRL/cloudflare-tunnel-ingress-controller/blob/master/README.md)
- Use `mv .env.example .env` and replace the required variables.

On your remote server, you have to use
```shell
sudo ./k3s-server.sh
```
This will start the server and create a folder to contain our resources.
You can export the configuration with this command :
```shell
scp user@192.168.1.1:/etc/rancher/k3s/k3s.yaml ~/.kube/config
sed -i 's/127\.0\.0\.1/192\.168\.1\.1/g' ~/.kube/config
```
Change these two lines with whatever ip address your private server uses.

On your current computer, you can now access your cluster with `kubectl get pods -A`

You can follow the changes that will be made with one of these : [OpenLens](https://github.com/MuhammedKalkan/OpenLens) or [k9s](https://k9scli.io/)

You can now use the next shell script that will initiate everything for your cluster
```shell
./all.sh
# scripts started
# ./config/helm.sh # Configures helm repositories
# ./sed.sh # Replaces your variables for cloudflare deployment
# ./metallb/setup.sh # Configures the k8s load balancer
# ./cloudflare/setup.sh # Creates an ingress controller and deploys all our applications on a Cloudflare tunnel
# ./start.sh # Deploys all the applications on the cluster thanks to Helm using the chart configured for everything in the common folder

```
If you are using k3d, use these commands instead as you won't need Cloudflare :
(You may need to disable ingress on everything)
```shell
./config/helm.sh
./sed.sh
./metallb/setup.sh
./start.sh
```

After a few seconds, everything will be deployed and available !

## Resources

[Helm](https://helm.sh/) Simplifies common configurations

[MetalLB](https://metallb.universe.tf/) Load balancer, very useful for homelabs

[Clouflare Tunnel Ingress Controller](https://github.com/STRRL/cloudflare-tunnel-ingress-controller) Deploys everything on Cloudflare with barely any configuration

[Cloudflare Tunnel](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/) Allows us to avoid headaches with networking when it comes to deploying a private server to the cloud

## Future improvements

- Add other cool selfhosted applications
- Replace Homarr with [Dashy](https://dashy.to/)
- Configure Transmission to use a VPN