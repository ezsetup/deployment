source ./version.sh
docker build -t registry.gitlab.com/promises/deployment/reverse-proxy:${VERSION} .
