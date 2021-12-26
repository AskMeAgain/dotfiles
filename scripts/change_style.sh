#!/bin/bash
. /home/dev/scripts/utils.sh

if test -f "/home/dev/themes/$1/$1-light.json"; 
then
    wal --theme /home/dev/themes/$1/$1-light.json
    writeGtkTheme --light
else
    wal --theme /home/dev/themes/$1/$1-dark.json
    writeGtkTheme --dark
fi

dconf load /com/gexperts/Tilix/ < /home/dev/.cache/wal/tilix.dconf
mv /home/dev/.cache/wal/ranger-style.py /home/dev/.config/ranger/colorschemes/orchid.py
mv /home/dev/.cache/wal/flameshot.ini /home/dev/.config/flameshot/flameshot.ini
mv /home/dev/.cache/wal/i3-config /home/dev/.i3/config