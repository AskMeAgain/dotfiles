#!/bin/zsh

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source ~/Scripts/aliases.sh

export FZF_DEFAULT_OPTS='--height="40%"  --info=inline --reverse  --color=fg:-1,gutter:-1,prompt:0,pointer:-1,marker:2,info:2,fg+:-1,bg+:4'

alias _bookmarks='eval $(getBookmarks | fzf --preview-window follow:70%:right:rounded:wrap --preview="source ~/Scripts/aliases.sh && getPreviewText '{}'")'

fe() {
  IFS=$'\n' files=($(fzf-tmux --query="$1" --preview 'cat {}' --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

dl() {
  local cid
  cid=$(docker ps -a --format "table {{.ID}} \t{{.Image}}\t{{.Status}}\t{{.Ports}}" \
  | sed 1d | fzf --height='70%' --header="Select Container to be removed" \
  --preview 'docker logs $(echo {} | cut -d " " -f1) -n $FZF_PREVIEW_FILE'  --header="Select Container to display logs" \
  --preview-window follow:50%:down:rounded:wrap \
  -1 -q "$1" \
  | awk '{print $1}')

  [ -n "$cid" ] && docker logs "$cid" -f
}

drm() {
  local cid
  cid=$(docker ps -a --format "table {{.ID}} \t{{.Image}}\t{{.Status}}\t{{.Ports}}" | sed 1d \
  | fzf --preview 'docker logs $(echo {} | cut -d " " -f1) -n $FZF_PREVIEW_FILE' --height='70%'  --header="Select Containers to be removed" \
  --preview-window follow:50%:down:rounded:wrap --print0 --multi -1 -q "$1" | awk '{print $1}')
  
      	  docker rm -f $cid
}

dex() {
  local cid
  cid=$(docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}" | sed 1d \
  | fzf --preview 'docker logs $(echo {} | cut -d " " -f1) -n $FZF_PREVIEW_FILE' --height='70%' \
     --header="Select Container go into" --preview-window follow:50%:down:rounded:wrap --multi -1 -q "$1" | awk '{print $1}')

	if [[ $cid ]]; then
      for dockerId in $(echo $cid);
      	  [ -n "$cid" ] && docker exec -it "$dockerId" bash
    fi
}
