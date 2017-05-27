source ./version.sh
cd ../../webapp-vue
npm run build
cd ../deployment/webapp-vue
cp -r ../../webapp-vue/dist/ ./dist/
docker build -t registry.gitlab.com/promises/deployment/webapp-vue:${VERSION} .
