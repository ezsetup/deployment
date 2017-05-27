source ./version.sh
docker stop promises-deployment-api-server
docker rm promises-deployment-api-server
docker run -d -p 5001:5001 --name promises-deployment-api-server registry.gitlab.com/promises/deployment/api-server:${VERSION}
