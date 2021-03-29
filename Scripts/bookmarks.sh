#!/bin/sh

alias ccc="xclip -sel clip"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias shutdown='shutdown now'
alias rma='docker rm -f $(docker ps -a -q)'
alias dps='docker ps -a --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"'
alias upgrade-system='echo '1234' | sudo -S pacman-mirrors --fasttrack 5 && echo '1234' | sudo -S pacman -Syyu --noconfirm'
if [ $UID -ne 0 ]; then
    alias reboot="echo '1234' | sudo -S reboot"
fi

function getBookmarks(){
	echo "upgrade-system"
	echo "dps"
	echo "dl"
	echo "dex"
	echo "drm"
	echo "rma"
}

function getPreviewText() {
	case $1 in	
	  "dps") echo "Pretty Prints docker commands" ;;	
	  "upgrade-system") echo "Upgrades the whole system" ;;
	  "dl") echo "Opens docker container list for log utility" ;;
	  "dex") echo "Opens docker container list for docker exec utility" ;;
	  "drm") echo "Opens docker container list for docker rm -f utility" ;;
	  "rma") echo "Removes all containers" ;;
	esac
	echo ""
	type $1
}

