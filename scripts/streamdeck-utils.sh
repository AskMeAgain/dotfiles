#!/bin/sh

reload_config(){
	pkill streamdeck; streamdeck -n &
}

switch_page(){
	sed -i "s/\"page\":.*/\"page\": $1/g" /home/dev/.streamdeck_ui.json  
	reload_config
}
