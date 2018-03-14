source ../.env
cd ../../frontend \
    && API_SERVER=http://172.16.100.4:5002 npm run build
cd ../deployment/webapp-vue \
    && cp -r ../../frontend/dist/ ./dist/
docker build -t registry.gitlab.com/promises/deployment/webapp-vue:${WEBAPP_VUE_VERSION} .
docker push registry.gitlab.com/promises/deployment/webapp-vue:${WEBAPP_VUE_VERSION}
