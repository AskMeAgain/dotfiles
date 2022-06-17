export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nano
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=google-chrome-stable
export PATH=/snap/bin/:$PATH
export PATH=~/idea/bin/:$PATH
export PATH=~/pycharm/bin/:$PATH
export PATH=~/scripts/:$PATH

yadm fetch --all && yadm reset --hard origin/master && chmod +x -R ~/scripts/

