#!/bin/sh
. /home/dev/scripts/streamdeck-utils.sh

i3-msg "workspace number $1" &
switch_page $2 &
