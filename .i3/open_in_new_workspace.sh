#!/bin/zsh

WS=$(($(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 | sort -rn | head -1) + 1))
i3-msg "workspace number $WS; exec --no-startup-id tilix -a app-new-window -x 'zsh -c $1'"
