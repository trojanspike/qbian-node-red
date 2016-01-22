#!/usr/bin/env bash
COMMAND=$1 # if [$COMMD = start | stop | reload]

WORK_DIR=~/node-red
PORT=8080

ENV="develop"

eth0=$(cat /sys/class/net/eth0/operstate); # up | down
wlan0=$(cat /sys/class/net/wlan0/operstate); # up | down

###
NODE_RED=$(which node-red)
if [ "$COMMAND" == "start" ];then

	if [ -d ~/.c9sdk ];then
		forever start ~/.c9sdk/server.js -p $PORT -l 0.0.0.0  -w $WORK_DIR --collab true --packed false -a :
	else
		sleep 7 && clear && \
		echo -e "Cloud9 IDE not install yet. Install now ? [y/n]" && \
		read INSTALL_C9
		if [ "$INSTALL_C9" == "y" ];then
			echo -e "Install cloud9 IDE , this will take a while to complete." && sleep 8 && \
			c9-install
		fi
	fi
		# Run block if node-red is not install & device has gpio folder [ pi ]
	if [ ! -d ~/node-red ] && [ -d "/sys/class/gpio" ];then
		sleep 7 && clear && \
		echo -e "Node-red not install yet. Install now ? [y/n]" && \
		read INSTALL_NODE_RED
		if [ "$INSTALL_NODE_RED" == "y" ];then
			echo -e "Install node-red , this will take a while to complete" && sleep 8 && \
			node-red-install
		fi
	fi
	# sudo-node `which node-red` -s node-red-user-dir/settings.js -u node-red-user-dir/ -v

fi

if [ "$COMMAND" == "reload" ];then
	echo ""
fi

if [ "$COMMAND" == "stop" ];then
	echo ""
fi
