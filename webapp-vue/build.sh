source ../.env
cd ../../webapp-vue \
    && npm run build
cd ../deployment/webapp-vue \
    && cp -r ../../webapp-vue/dist/ ./dist/
docker build -t registry.gitlab.com/promises/deployment/webapp-vue:${WEBAPP_VUE_VERSION} .
docker push registry.gitlab.com/promises/deployment/webapp-vue:${WEBAPP_VUE_VERSION}
