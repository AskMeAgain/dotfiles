#!/bin/bash

wal --theme /home/dev/themes/$1/$1.json

dconf load /com/gexperts/Tilix/ < /home/dev/.cache/wal/tilix.dconf
