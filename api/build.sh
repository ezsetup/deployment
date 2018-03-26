cd ..
source .env
git -C source pull || git clone https://github.com/nguyendv/ezsetup source

cd api
rsync -av ../source/api/ ./app

docker build -t ezsetup/api:${API_SERVER_VERSION} -t ezsetup/api:latest .

docker push ezsetup/api:${API_SERVER_VERSION}
docker push ezsetup/api:latest
