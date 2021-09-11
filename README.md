# Orchid style compatible with DEVBOX

Check this out: https://github.com/AskMeAgain/Devbox

Installation files to use with yadm and DevBox. 

## Introduction

These dotfiles originally started for a lighttheme, but after discoving pywal, i started to support multiple themes in this repo. So in the future this repo will be moved to a more fitting repository name.

The winter and the vaporwave theme (see screenshots below) are currently fully supported

## Usage

After installing these dependencies, enter "change_style.sh winter" in a console to switch to a style (look for the themes folder to see all current installed styles).

If you want to try out your own style, get an url to a wallpaper you would like to use. 
Make sure that the url ends with a file ending http://cool-image-site.com/cool-picture.jpg (see .jpg here)

execute following command from a console:

try_style.sh (URL) (--light or --dark) (Value from 0 to 100 for alpha background) (optional -f flag to provide a local file)

Follow the instructions on screen to save the theme if you like it.

## Screenshots

![Screenshot1](/screenshots/screenshot1.png)
![Screenshot2](/screenshots/screenshot2.png)
![Screenshot3](/screenshots/screenshot3.png)

## Theme layout for pywal

* color0: polybar background
* color15: polybar foreground
* color2, color 10: success