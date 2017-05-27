source ./version.sh
docker push registry.gitlab.com/promises/deployment/reverse-proxy:${VERSION}
