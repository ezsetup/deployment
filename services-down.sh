#!/bin/bash

# MAIN
case $1 in
all)
    sudo docker-compose down
    ;;
*)
    echo -e "\033[1;31m Wrong option \033[0m"
    echo -e "\033[1;31m USAGE: bash $0 {all} \033[0m"
    exit
    ;;
esac

