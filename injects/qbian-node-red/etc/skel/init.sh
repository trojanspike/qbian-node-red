#!/usr/bin/env bash
COMMAND=$1 # if [$COMMD = start | stop | reload]

WORK_DIR=~/
PORT=8080

ENV="develop"

eth0=$(cat /sys/class/net/eth0/operstate); # up | down
wlan0=$(cat /sys/class/net/wlan0/operstate); # up | down

###
NODE_RED=$(which node-red)
if [ "$COMMAND" == "start" ];then
	# ~/bin/c9-install
	# sudo-node `which node-red` -s node-red-user-dir/settings.js -u node-red-user-dir/ -v
	# forever start ~/.c9sdk/server.js -p $PORT -l 0.0.0.0  -w $WORK_DIR --collab true --packed false -a :
	forever start ~/forever-config.json
fi

if [ "$COMMAND" == "reload" ];then
	echo ""
fi

if [ "$COMMAND" == "stop" ];then
	echo ""
fi
