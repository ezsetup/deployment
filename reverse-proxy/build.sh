source ../.env
docker build -t registry.gitlab.com/promises/deployment/reverse-proxy:${REVERSE_PROXY_VERSION} .
docker push registry.gitlab.com/promises/deployment/reverse-proxy:${REVERSE_PROXY_VERSION}
