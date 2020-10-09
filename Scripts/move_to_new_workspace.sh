#!/bin/bash
. ./utils.sh

WS=$(getNextWorkspace)

i3-msg "move container to workspace $WS"

gotoWorkspace $WS
