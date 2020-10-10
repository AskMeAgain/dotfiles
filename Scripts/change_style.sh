#!/bin/bash

wal --theme ~/themes/$1/$1.json

dconf load /com/gexperts/Tilix/ < ~/.cache/wal/tilix.dconf
