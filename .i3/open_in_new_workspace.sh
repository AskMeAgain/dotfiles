#!/bin/zsh

not_in_console=("firefox" "idea") 

if [ "$2" = "--new-workspace" ]; 
then 
	WS=$(($(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 | sort -rn | head -1) + 1))
else
	WS=$(i3-msg -t get_workspaces  | jq '.[] | select(.focused==true).name'  | cut -d"\"" -f2)
fi

#switch to correct workspace
i3-msg "workspace number $WS"

# if special list contains para, start not in console
if [[ " "${not_in_console[@]}" " == *" "$1" "* ]]; 
then
	echo "new window"
	i3-msg "exec --no-startup-id $1";
else
	echo "in console"
	i3-msg "exec tilix -a app-new-window -x 'zsh -c $1'"
fi
