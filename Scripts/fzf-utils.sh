#!/bin/zsh

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

fe() {
  IFS=$'\n' files=($(fzf-tmux --query="$1" --height='40%' --reverse --info=inline --preview 'cat {}' --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# fh - repeat history
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf --height='40%' --reverse --info=inline +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

dl() {
  local cid
  cid=$(docker ps -a --format "table {{.ID}}_\t{{.Image}}\t{{.Status}}\t{{.Ports}}" \
  | sed 1d | fzf --height='60%' \
  --preview 'docker logs $(echo {} | cut -d "_" -f1)' \
  --preview-window follow:12:down:rounded:wrap:cycle \
  --reverse --info=inline -1 -q "$1" \
  | awk '{print $1}')

  [ -n "$cid" ] && docker logs "$cid" -f
}

drm() {
  local cid
  cid=$(docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}" | sed 1d | fzf --height='40%' --reverse --info=inline --multi -1 -q "$1" | awk '{print $1}')

	if [[ $cid ]]; then
      for dockerId in $(echo $cid);
      	  [ -n "$cid" ] && docker rm -f "$dockerId"
    fi
}
