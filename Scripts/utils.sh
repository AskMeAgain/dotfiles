getNextWorkspace(){
	WS=$(($(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 | sort -rn | head -1) + 1))
	echo $WS
}

getCurrentWorkspace(){
	WS=$(i3-msg -t get_workspaces  | jq '.[] | select(.focused==true).name'  | cut -d"\"" -f2)
	echo $WS
}

gotoWorkspace(){
	i3-msg "workspace $WS"
}

not_in_console=("firefox" "idea") 

openProgram(){
	# if special list contains para, start not in console
	if [[ " "${not_in_console[@]}" " == *" "$1" "* ]]; 
	then
		i3-msg "exec --no-startup-id $1";
	else
		i3-msg "exec tilix -a app-new-window -x 'zsh -c $1'"
	fi
}
