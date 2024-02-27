# Home Lab

Project based on [k3s](https://k3s.io/) to host various apps to manage tv shows and movies.

## Applications

[Homepage](https://github.com/gethomepage/homepage): Application dashboard

[Prowlarr](https://github.com/Prowlarr/Prowlarr): Torrent indexer

[Flaresolverr](https://github.com/FlareSolverr/FlareSolverr): Bypass Cloudflare and DDoS-GUARD protection. Solely used by Prowlarr

[Sonarr](https://github.com/Sonarr/sonarr): Queues TV shows requests and processes them when completed

[Radarr](https://github.com/Radarr/radarr): Same as Sonarr but for movies

[Transmission](https://github.com/transmission/transmission): Torrent downloader

[Jellyfin](https://github.com/jellyfin/jellyfin): Library manager and media system for your video files

[Jellyseerr](https://github.com/Fallenbagel/jellyseerr): Displays popular movies and tv shows you can request

[Rancher](https://github.com/rancher/dashboard): Rancher dashboard to visualize clusters

## How to use

### Prerequisites

- Use `mv .env.example .env` and replace the required variables
- Create a Tailscale account and follow [the instructions](https://tailscale.com/kb/1236/kubernetes-operator)

### Commands
On your remote server, you have to use
```shell
sudo ./scripts/server.sh
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
./scripts/all.sh
# scripts started
# ./config/helm.sh # Configures helm repositories
# ./tailscale/setup.sh # Configures Tailscale operator
# ./scripts/sed.sh # Replaces your variables for Tailscale proxy and VPN setup
# ./rancher/setup.sh # Installs Rancher
# ./monitoring/setup.sh # Starts Prometheus & Grafana
# kubectl apply -k config # Prepares the configuration for the cluster
# kubectl config set-context --current --namespace=dev # Sets the default namespace to dev where our applications will be
# kubectl apply -k postgres # Adds Postgres to the cluster
# ./scripts/start.sh # Deploys all the applications on the cluster thanks to Helm using the chart configured for everything in the common folder

```

After a few seconds, everything will be deployed and available !
To configure your application, you have to set up internal urls as `[application].dev.svc.cluster.local:[service-port]`.
You can acces your applications at `https://[application].[tailscale-dns]`

#### Stop & Teardown
In order to stop the applications, you can either `helm uninstall [application]` to stop one or `./scripts/stop.sh` to stop everything.

If you want to destroy everything, you have to use `scripts/teardown.sh`


## Resources

[Helm](https://helm.sh/) Simplifies common configurations

[Gluetun](https://github.com/qdm12/gluetun): VPN container to use transmission over VPN

[Tailscale](https://github.com/tailscale/tailscale): Private WireGuard with DNS resolution

[PostgreSQL](https://github.com/postgres/postgres): SQL Database


###
:warning: Cloudflare Tunnel doesn't allow video streaming so I opted out of it in favor of Tailscale