cd ..
source .env
git -C source pull || git clone https://github.com/ezsetup/ezsetup source

cd worker
rsync -av ../source/api/ ./app

docker build -t ezsetup/worker:${API_VERSION} -t ezsetup/worker:latest .
docker push ezestup/worker:${API_VERSION}
docker push ezsetup/worker:latest
