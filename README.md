# Deployment scripts for EZSetup application, which includes proxyserver, fronted, and api backend services
## Requirements
- Ubuntu (Tested on Ubuntu 16.04)
- Docker
## Service dependencies
- pg = 0.12.0
## How?
- Edit .env file
- cd to api-server/ then run `bash build.sh` if api-server changes
- cd to webapp-vue/ then run `bash build.sh` if webapp-vue changes
- cd to reverse-proxy/ then run `bash build.sh` if reverse-proxy changes
- install docker, docker-compose on target host
- use `bash scp.sh` or manually copy `up-services.sh, down-services.sh, .env, docker-compose.yml` to the target host
- ssh into the target host
- run `sudo docker login registry.gitlab.com` or your registry address. No need
  for this step if docker hub is used.
- run `bash down-services.sh all && bash up-services.sh all` to update all services
- or run `bash up-services.sh service-name` to update individual services

## Dependencies


## .env content

WEBAPP_VUE_VERSION=
REVERSE_PROXY_VERSION=
API_SERVER_VERSION=
POSTGRES_USER=
POSTGRES_PASSWORD=
POSTGRES_HOST=
SENTRY_DSN=

export WEBAPP_VUE_VERSION
export REVERSE_PROXY_VERSION
export API_SERVER_VERSION
export POSTGRES_USER
export POSTGRES_PASSWORD
export POSTGRES_HOST
export SENTRY_DSN

