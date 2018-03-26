cd ..
source .env
git -C source pull || git clone https://github.com/nguyendv/ezsetup source
cd source/frontend \
    && npm install && API_SERVER=http://172.16.100.4:5002 npm run build
cd ../../frontend \
    && cp -r ../source/frontend/dist/ ./dist/
docker build -t ezsetup/frontend:${WEBAPP_VUE_VERSION} -t ezsetup/frontend:latest .
docker push ezsetup/frontend:${WEBAPP_VUE_VERSION}
docker push ezsetup/frontend:latest
