#!/bin/bash

# MAIN

source .env # .env is needed for docker-compose to read

if [ -z $POSTGRES_USER ]; then
    echo -e "\033[1;31m POSTGRES_USER needs to be set \033[0m"
    exit
fi
if [ -z $POSTGRES_PASSWORD ]; then
    echo -e "\033[1;31m POSTGRES_USER needs to be set \033[0m"
    exit
fi

#if [ -z $SENTRY_DSN ]; then
#    echo -e "\033[1;31m SENTRY_DSN needs to be set \033[0m"
#    exit
#fi


case $1 in
all)
    sudo docker pull ezsetup/reverse-proxy:latest \
        && echo "OK" || exit
    sudo docker pull ezsetup/api:latest \
        && echo "OK" || exit
    sudo docker pull ezsetup/worker:latest\
        && echo "OK" || exit
    sudo docker pull ezsetup/frontend:latest \
        && echo "OK" || exit
    sudo docker-compose up -d
    ;;
api)
    sudo docker pull ezsetup/api:latest \
        && echo "OK" || exit
    sudo docker-compose up -d --no-deps api-server
    ;;
frontend)
    sudo docker pull ezsetup/frontend:latest \
        && echo "OK" || exit
    sudo docker-compose up -d --no-deps web
    ;;
reverse-proxy)
    sudo docker pull ezsetup/reverse-proxy:latest \
        && echo "OK" || exit
    sudo docker-compose up -d --no-deps reverse-proxy
    ;;
*)
    echo -e "\033[1;31m Wrong option \033[0m"
    echo -e "\033[1;31m USAGE: bash $0 {all|api|frontend|reverse-proxy} \033[0m"
    exit
    ;;
esac

