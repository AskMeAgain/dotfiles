#!/bin/sh

version=$1
url="https://github.com/obsidianmd/obsidian-releases/releases/download/v${version}/Obsidian-${version}.AppImage"
echo $url
curl -L "${url}" --output /home/dev/obsidian 
chmod +x /home/dev/obsidian
