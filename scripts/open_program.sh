#!/bin/bash
. ~/scripts/utils.sh

if [ "$2" = "--new-workspace" ]; 
then 
	WS=$(getNextWorkspace)
else
	WS=$(getCurrentWorkspace)
fi

#switch to correct workspace
i3-msg "workspace number $WS"

openProgram $1
