#!/bin/sh

alias ccc="xclip -sel clip"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias shutdown='shutdown now'
alias rma='docker rm -f $(docker ps -a -q)'
alias upgrade-system='echo '1234' | sudo -S pacman-mirrors --fasttrack 5 && echo '1234' | sudo -S pacman -Syyu --noconfirm'
