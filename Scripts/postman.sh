#!/bin/sh

apikey='xxx'
baseUrl='xxx'
url="$baseUrl?apikey=$apikey"

sandbox="18926921-fda425dd-cbe8-4dff-a4eb-0c5ec634ebe2"
local="18926921-0afd6f7c-3c52-471d-b907-f2f9ccb76a0c"
int="18926921-38078e7b-b351-4445-93a6-1553c692f765"

code=0

if [[ $1 == "sandbox" ]]; then
	setup=true
	envi="https://api.getpostman.com/environments/$sandbox?apikey=$apikey"
elif [[ $1 == "local" ]]; then 
	setup=true
	envi="https://api.getpostman.com/environments/$local?apikey=$apikey"
elif [[ $1 == "int" ]];then
	setup=true
	envi="https://api.getpostman.com/environments/$int?apikey=$apikey"
else
	newman run "$url" --folder $1 -e "/home/dev/scripts/envi.json" --silent
	code=$?
fi

if [[ ! -z "$setup" ]]; then
	newman run "/home/dev/Scripts/EmptyCollection.json"  --export-environment /home/dev/Scripts/envi.json -e "$envi" --silent
	code=$?
fi


if [[ $? == "1" ]]; then
	code="Error"
else
	code="Success"
fi

zenity --notification --text="Done $code"
