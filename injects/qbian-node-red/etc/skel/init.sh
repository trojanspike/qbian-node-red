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
	# forever start ~/.c9sdk/server.js -p $PORT -l 0.0.0.0  -w $WORK_DIR --collab true --packed false -a :
	forever start --uid "qbian-node-red-env" -a -c "sudo-node" $NODE_RED -s ~/node-red-user-dir/settings.js -u ~/ -v
fi

if [ "$COMMAND" == "reload" ];then
	echo ""
fi

if [ "$COMMAND" == "stop" ];then
	echo ""
fi
