cd ..
source .env
git -C source pull || git clone https://github.com/ezsetup/ezsetup source
cd source/frontend \
    && npm install && npm run build
cd ../../frontend \
    && cp -r ../source/frontend/dist/ ./dist/
docker build -t ezsetup/frontend:${FRONTEND_VERSION} -t ezsetup/frontend:latest .
docker push ezsetup/frontend:${FRONTEND_VERSION}
docker push ezsetup/frontend:latest
