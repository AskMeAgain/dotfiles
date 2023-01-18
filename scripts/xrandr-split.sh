#!/bin/sh

xrandr --setmonitor VIRTUAL-LEFT 960/0x1080/1+0+0 Virtual1
xrandr --setmonitor VIRTUAL-RIGHT 960/1x1080/1+960+0 Virtual2

xrandr --output Virtual2 --auto --right-of Virtual1
xrandr --output Virtual1 --auto --left-of Virtual2
