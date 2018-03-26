cd ..
source .env
git -C source pull || git clone https://github.com/nguyendv/ezsetup source

cd worker
rsync -av ../source/api/ ./app

docker build -t ezsetup/worker:${API_SERVER_VERSION} -t ezsetup/worker:latest .
docker push ezestup/worker:${API_SERVER_VERSION}
docker push ezsetup/worker:latest
