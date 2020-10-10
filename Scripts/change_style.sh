#!/bin/bash

tmp=$(mktemp)

curl $1 > $tmp

wal -i $tmp

dconf load /com/gexperts/Tilix/ < ~/.cache/wal/tilix.dconf
