#!/bin/sh

rofi -modi "clipboard:greenclip print" -show clipboard -run-command '{cmd}'
sleep 0.2

xdotool key Ctrl+v
