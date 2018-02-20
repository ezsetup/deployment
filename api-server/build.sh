source ../.env
cp -r ../../api/ ./app

docker build -t registry.gitlab.com/promises/deployment/api-server:${API_SERVER_VERSION} .
docker push registry.gitlab.com/promises/deployment/api-server:${API_SERVER_VERSION}
