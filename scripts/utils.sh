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

writeGtkTheme(){

if [ "$1" == "--light" ]
then	
	TMP="Orchis-light"
else
	TMP="Nordian-Breeze-GTK"
fi

sed -i "s/gtk-theme-name=.*/gtk-theme-name=$TMP/g" /home/dev/.config/gtk-3.0/settings.ini

}

not_in_console=("idea-ultimate" "firefox" "google-chrome-stable" "idea" "idea.sh" "postman" "dbeaver" "/home/dev/obsidian" "pycharm.sh") 

openProgram(){
	if [[ "streamdeck" == $1 ]];
	then
		i3-msg "exec --no-startup-id pkill streamdeck"
		i3-msg "exec python3 /bin/streamdeck && exec streamdeck -n"
	else
		if [[ " "${not_in_console[@]}" " == *" "$1" "* ]]; 
		then
			i3-msg "exec --no-startup-id $1";
		else
			i3-msg "exec tilix -a app-new-window -x 'zsh -c $1'"
		fi
	fi
}

unpack_tar_gz(){
	tar -xzf $1
	echo "Done unpacking .tar.gz"
}
