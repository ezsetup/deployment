VERSION=0.17.05
docker stop promises-deployment-webapp-vue
docker rm promises-deployment-webapp-vue
docker run -d -p 443:443 -p 80:80 --name promises-deployment-webapp-vue registry.gitlab.com/promises/deployment/webapp-vue:${VERSION}