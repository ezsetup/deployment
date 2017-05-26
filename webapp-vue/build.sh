VERSION=0.17.05
cp -r ../../webapp-vue/dist/ ./dist/
docker build -t registry.gitlab.com/promises/deployment/webapp-vue:${VERSION} .