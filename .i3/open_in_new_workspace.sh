#!/bin/zsh

in_console=("ranger")

if [ "$2" = "--new-workspace" ]; 
then 
	WS=$(($(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 | sort -rn | head -1) + 1))
else
	WS=$(i3-msg -t get_workspaces  | jq '.[] | select(.focused==true).name'  | cut -d"\"" -f2)
fi

#switch to correct workspace
i3-msg "workspace number $WS;"

#if string ends with .sh it should be run in console
if [[ "$1" == *.sh ]];
then
	i3-msg "exec tilix -a app-new-window -x 'zsh -c $1'"
else
	# if special list contains para, start in console
	if [[ " "${in_console[@]}" " == *" "$1" "* ]]; 
	then
		i3-msg "exec tilix -a app-new-window -x 'zsh -c $1'"
	else
		i3-msg "exec --no-startup-id $1";
	fi
fi
