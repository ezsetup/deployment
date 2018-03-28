cd ..
source .env
git -C source pull || git clone https://github.com/ezsetup/ezsetup source

cd api
rsync -av ../source/api/ ./app

docker build -t ezsetup/api:${API_VERSION} -t ezsetup/api:latest .

docker push ezsetup/api:${API_VERSION}
docker push ezsetup/api:latest
