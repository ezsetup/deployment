source ../.env
docker stop promises-deployment-api-server
docker rm promises-deployment-api-server
docker run -d -p 5003:5003 --name promises-deployment-api-server registry.gitlab.com/promises/deployment/api-server:${API_SERVER_VERSION}
