#!/bin/sh

alias ccc="xclip -sel clip"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias shutdown='shutdown now'
alias docker start='docker_start'
alias rma='docker rm -f $(docker ps -a -q)'
alias dps='d ps'
alias di='d inspect'
alias dsta='d start'
alias dsto='d stop'
alias dex='d exec'
alias dl='d logs'
alias drm='d rm'
alias upgrade-system='echo '1234' | sudo -S pacman-mirrors --fasttrack 5 && echo '1234' | sudo -S pacman -Syyu --noconfirm'
if [ $UID -ne 0 ]; then
    alias reboot="echo '1234' | sudo -S reboot"
fi

alias _bookmarks='eval $(getBookmarks | fzf --preview-window follow:70%:right:rounded:wrap --preview="source ~/Scripts/bookmarks.sh && getPreviewText {} )'

function getBookmarks(){
	echo "upgrade-system"
	echo "dps"
	echo "dl"
	echo "dex"
	echo "dsta"
	echo "dre"
	echo "dsto"
	echo "di"
	echo "drm"
	echo "rma"
}

function getPreviewText() {
	echo $1
	case $1 in	
	  "dps") echo "Pretty Prints docker commands" ;;	
	  "upgrade-system") echo "Upgrades the whole system" ;;
	  "dl") echo "Opens docker container list for log utility" ;;
	  "dre") echo "Opens docker container list for docker restart utility" ;;
	  "dex") echo "Opens docker container list for docker exec utility" ;;
	  "drm") echo "Opens docker container list for docker rm -f utility" ;;
	  "rma") echo "Removes all containers" ;;
	  "di") echo "Opens docker container list for docker inspect utility" ;;
	esac
	echo ""
	type $1
}

