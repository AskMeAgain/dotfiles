#!/bin/bash

wal --theme ~/themes/$1/$1.json

dconf load /com/gexperts/Tilix/ < /home/dev/cache/wal/tilix.dconf
