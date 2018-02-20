source ../.env
cd ../../frontend \
    && npm run build
cd ../deployment/webapp-vue \
    && cp -r ../../frontend/dist/ ./dist/
docker build -t registry.gitlab.com/promises/deployment/webapp-vue:${WEBAPP_VUE_VERSION} .
docker push registry.gitlab.com/promises/deployment/webapp-vue:${WEBAPP_VUE_VERSION}
