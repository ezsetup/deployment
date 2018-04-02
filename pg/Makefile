container_name = ezsetup_pg
PG_IMAGE_VERSION = 2018.03.12
PGDATA = /var/lib/postgresql/data/pgdata

shell:
	psql -h localhost -p 5433 -U ${POSTGRES_USER}
	
build:
	# build the db with backup data
	docker build -t ezsetup/pg:${PG_IMAGE_VERSION} -t ezsetup/pg:latest . && \
	docker push ezsetup/pg:${PG_IMAGE_VERSION} && \
	docker push ezsetup/pg:latest

build-init:
	# build the initial (clean) version of the db
	docker build -t ezsetup/pg:${PG_IMAGE_VERSION} -t ezsetup/pg:latest -f Dockerfile.init . && \
	docker push ezsetup/pg:${PG_IMAGE_VERSION} && \
	docker push ezsetup/pg:latest
run:
	sudo docker stop ${container_name} && \
	sudo docker rm -v ${container_name}; \
	sudo docker run -d -p 5433:5432 --name ${container_name} --restart=unless-stopped -e POSTGRES_USER=${POSTGRES_USER} -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} -e PGDATA=${PGDATA} -v $(CURDIR)/pgdata:${PGDATA} registry.gitlab.com/promises/pg:${PG_IMAGE_VERSION}

dump:
	echo ${POSTGRES_PASSWORD}
	pg_dump -U ${POSTGRES_USER} -h localhost -p 5433 -d ${POSTGRES_USER} > `date +%Y-%m-%d`.sql

logs:
	docker logs -f ${container_name}
