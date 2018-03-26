source ../.env
docker build -t ezsetup/reverse-proxy:${REVERSE_PROXY_VERSION} -t ezsetup/reverse-proxy:latest .

docker push ezsetup/reverse-proxy:${REVERSE_PROXY_VERSION}
docker push ezsetup/reverse-proxy:latest
