#!/bin/sh

fzf_docker(){
	all_flag=$1
	shift
	cid=$(docker ps "$all_flag" --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}" | sed 1d \
	  | fzf --preview 'docker logs $(echo {} | cut -d " " -f1) -n $FZF_PREVIEW_LINES' --height='70%' \
	  --header="Select Container to go into" --preview-window follow:50%:down:rounded:wrap --multi -1 -q "$1" | awk '{print $1}')

	[ -n "$cid" ] && echo "$cid"
}

dex(){
	cid=$(fzf_docker "-s" $@)
	docker exec -it "$cid" sh
}

dl(){
	fzf_docker "-a" $@ | xargs -I{} docker logs {} -f	
}

dsta(){
	fzf_docker "-a" $@ | xargs -I{} docker start {}
}

dsto(){
	fzf_docker "-s" $@ | xargs -I{} docker stop {}
}

di(){
	fzf_docker "-a" $@ | xargs -I{} docker inspect {}
}

dre(){
	fzf_docker "-s" $@ | xargs -I{} docker restart {}
}

drm(){
	fzf_docker "-a" $@ | xargs -I{} docker rm -f {}
}

dps() {
  if [[ -z "$1" ]];
  then
    docker ps -a --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"
  else
    while [ true ]; do 
      docker ps -a --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"
      sleep $1
    done
  fi
}