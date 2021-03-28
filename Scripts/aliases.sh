#!/bin/sh

## Alias section 
alias ccc="xclip -sel clip"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias nano='micro'
alias dps='docker ps -a --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"'
if [ $UID -ne 0 ]; then
    alias reboot="echo '1234' | sudo -S reboot"
fi
alias shutdown='shutdown now'