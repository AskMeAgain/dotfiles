#!/bin/bash

alias ccc="xclip -sel clip"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias shutdown='shutdown now'
alias docker start='docker_start'
alias rma='docker rm -f $(docker ps -a -q)'
alias dps='d ps'
alias dps='d restart'
alias di='d inspect'
alias dsta='d start'
alias dsto='d stop'
alias dex='d exec'
alias dl='d logs'
alias drm='d rm'
alias upgrade-system='echo '1234' | sudo -S pacman-mirrors --fasttrack 5 && echo '1234' | sudo -S pacman -Syyu --noconfirm'