#!/bin/zsh

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source ~/Scripts/bookmarks.sh

export FZF_DEFAULT_OPTS='--height="40%"  --info=inline --reverse  --color=fg:-1,gutter:-1,prompt:0,pointer:-1,marker:2,info:2,fg+:-1,bg+:4'

alias _bookmarks='eval $(getBookmarks | fzf --preview-window follow:70%:right:rounded:wrap --preview="source ~/Scripts/bookmarks.sh && getPreviewText '{}'")'

fe() {
  IFS=$'\n' files=($(fzf-tmux --query="$1" --preview 'cat {}' --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

docker_logs() {
  local cid
  cid=$(docker ps -a --format "table {{.ID}} \t{{.Image}}\t{{.Status}}\t{{.Ports}}" \
  | sed 1d | fzf --height='70%' --header="Select Container to be removed" \
  --preview 'docker logs $(echo {} | cut -d " " -f1) -n $FZF_PREVIEW_LINES'  --header="Select Container to display logs" \
  --preview-window follow:50%:down:rounded:wrap -1 -q "$1" \
  | awk '{print $1}')

  [ -n "$cid" ] && docker logs "$cid" -f
}

docker_rm() {
  local cid
  cid=$(docker ps -a --format "table {{.ID}} \t{{.Image}}\t{{.Status}}\t{{.Ports}}" | sed 1d \
  | fzf --preview 'docker logs $(echo {} | cut -d " " -f1) -n $FZF_PREVIEW_LINES' --height='70%'  --header="Select Containers to be removed" \
  --preview-window follow:50%:down:rounded:wrap --print0 --multi -1 -q "$1" | awk '{print $1}')
  
  docker rm -f $cid
}

docker_restart() {
  local cid
  cid=$(docker ps -a --format "table {{.ID}} \t{{.Image}}\t{{.Status}}\t{{.Ports}}" | sed 1d \
  | fzf --preview 'docker logs $(echo {} | cut -d " " -f1) -n $FZF_PREVIEW_LINES' --height='70%'  --header="Select Containers to be removed" \
  --preview-window follow:50%:down:rounded:wrap --print0 --multi -1 -q "$1" | awk '{print $1}')
  
  docker restart $cid
}

docker_stop() {
  local cid
  cid=$(docker ps -a --format "table {{.ID}} \t{{.Image}}\t{{.Status}}\t{{.Ports}}" | sed 1d \
  | fzf --preview 'docker logs $(echo {} | cut -d " " -f1) -n $FZF_PREVIEW_LINES' --height='70%'  --header="Select Containers to be removed" \
  --preview-window follow:50%:down:rounded:wrap --print0 --multi -1 -q "$1" | awk '{print $1}')
  
  docker stop $cid
}

docker_start() {
  local cid
  cid=$(docker ps -a --format "table {{.ID}} \t{{.Image}}\t{{.Status}}\t{{.Ports}}" | sed 1d \
  | fzf --preview 'docker logs $(echo {} | cut -d " " -f1) -n $FZF_PREVIEW_LINES' --height='70%'  --header="Select Containers to be removed" \
  --preview-window follow:50%:down:rounded:wrap --print0 --multi -1 -q "$1" | awk '{print $1}')
  
  docker start $cid
}

docker_exec() {
  local cid
  cid=$(docker ps -a --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}" | sed 1d \
  | fzf --preview 'docker logs $(echo {} | cut -d " " -f1) -n $FZF_PREVIEW_LINES' --height='70%' \
     --header="Select Container go into" --preview-window follow:50%:down:rounded:wrap --multi -1 -q "$1" | awk '{print $1}')

  STATE=$(docker inspect $cid | jq '.[0].State.Status')
  
  if [[ $STATE == *"unnin"* ]];
  then
    [ -n "$cid" ] && docker exec -it "$cid" bash
  else
	docker commit $cid temp/tempcontainer
	docker run -it temp/tempcontainer sh
  fi
}

docker_inspect() {
  local cid
  cid=$(docker ps -a --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}" | sed 1d \
  | fzf --preview 'docker logs $(echo {} | cut -d " " -f1) -n $FZF_PREVIEW_LINES' --height='70%' \
  --header="Select Container go into" --preview-window follow:50%:down:rounded:wrap --multi -1 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker inspect "$cid"
}

docker() {
    CMD=$1
    shift
    if [ -z "$CMD" ]; then
        docker
    else
        if [ "$CMD" = "inspect" ]; then
          docker_inspect $@
        elif [ "$CMD" = "rm" ]; then
          docker_rm $@
        elif [ "$CMD" = "exec" ]; then
          docker_exec $@
        elif [ "$CMD" = "start" ]; then
          docker_start $@
        elif [ "$CMD" = "exec" ]; then
          docker_exec $@
        elif [ "$CMD" = "stop" ]; then
          docker_stop $@
        elif [ "$CMD" = "exec" ]; then
          docker_exec $@
        elif [ "$CMD" = "rm" ]; then
          docker rm $@
        elif [ "$CMD" = "logs" ]; then
          docker logs $@
        else
          docker $CMD $@
        fi
    fi
}