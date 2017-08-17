#!/bin/sh

param=${1:-"xxx"}
cmd="/usr/bin/node app.js"
image="nodejs:6.11.2"

if [ "start" == "$param" ]
then
	docker run -d --rm --privileged -v ${PWD}/work_folder:/root/nodejs -w /root/nodejs --name nodejs_host -h nodejs-host -P ${image} ${cmd}
	docker ps -l
elif [ "stop" == "$param" ]
then
	docker stop nodejs_host
else
	echo "Usage: mk_nodejs.sh start|stop"
fi
