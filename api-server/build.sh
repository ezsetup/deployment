source ./version.sh
cd app
git pull
cd ..

docker build -t registry.gitlab.com/promises/deployment/api-server:${VERSION} .
