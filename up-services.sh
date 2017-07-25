#!/bin/bash

# MAIN
source versions.sh

cp versions.sh .env # .env is needed for docker-compose to read

if [ -z $POSTGRES_USER ]; then
    echo -e "\033[1;31m POSTGRES_USER needs to be set \033[0m"
    exit
fi
if [ -z $POSTGRES_PASSWORD ]; then
    echo -e "\033[1;31m POSTGRES_USER needs to be set \033[0m"
    exit
fi
if [ -z $REVERSE_PROXY_VERSION ]; then
    echo -e "\033[1;31m REVERSE_PROXY_VERSION needs to be set \033[0m"
    exit
fi
if [ -z $API_SERVER_VERSION ]; then
    echo -e "\033[1;31m API_SERVER_VERSION needs to be set \033[0m"
    exit
fi
if [ -z $PG_VERSION ]; then
    echo -e "\033[1;31m PG_VERSION needs to be set \033[0m"
    exit
fi
if [ -z $WEBAPP_VUE_VERSION ]; then
    echo -e "\033[1;31m WEBAPP_VUE_VERSION needs to be set \033[0m"
    exit
fi
if [ -z $SENTRY_DSN]; then
    echo -e "\033[1;31m SENTRY_DSN needs to be set \033[0m"
    exit
fi


case $1 in
all)
    sudo docker pull registry.gitlab.com/promises/deployment/reverse-proxy:$REVERSE_PROXY_VERSION \
        && echo "OK" || exit
    sudo docker pull registry.gitlab.com/promises/deployment/api-server:$API_SERVER_VERSION \
        && echo "OK" || exit
    sudo docker pull registry.gitlab.com/promises/pg:$PG_VERSION \
        && echo "OK" || exit
    sudo docker pull registry.gitlab.com/promises/deployment/webapp-vue:$WEBAPP_VUE_VERSION \
        && echo "OK" || exit
    sudo docker-compose up -d
    ;;
api-server)
    sudo docker pull registry.gitlab.com/promises/deployment/api-server:$API_SERVER_VERSION \
        && echo "OK" || exit
    sudo docker-compose up -d --no-deps api-server
    ;;
web)
    sudo docker pull registry.gitlab.com/promises/deployment/webapp-vue:$WEBAPP_VUE_VERSION \
        && echo "OK" || exit
    sudo docker-compose up -d --no-deps web
    ;;
*)
    echo -e "\033[1;31m Wrong option \033[0m"
    echo -e "\033[1;31m USAGE: bash $0 {all|api-server|web} \033[0m"
    exit
    ;;
esac

