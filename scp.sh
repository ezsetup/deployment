COLOR_RED="\033[1;31m"
COLOR_END="\033[0m"
if [ -z $1 ]; then
	echo -e "${COLOR_RED}Usage: bash scp.sh ssh_key_file remote${COLOR_END}"
fi
if [ -z $2 ]; then
	echo -e "${COLOR_RED}Usage: bash scp.sh ssh_key_file remote${COLOR_END}"
fi

scp -i $1 .env $2:~/
scp -i $1 up-services.sh $2:~/
scp -i $1 down-services.sh $2:~/
scp -i $1 docker-compose.yml $2:~/
