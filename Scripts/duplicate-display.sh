#/bin/sh

killall -q polybar &
xrandr --output VGA-1 --same-as VGA-2
polybar --reload orchid &