#!/bin/zsh


source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

export FZF_DEFAULT_OPTS='--height="40%" --info=inline --reverse'

alias bookmarks='eval $(alias + | fzf)'

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
  | sed 1d | fzf --height='60%' \
  --preview 'docker logs $(echo {} | cut -d " " -f1)' \
  --preview-window follow:12:down:rounded:wrap \
  -1 -q "$1" \
  | awk '{print $1}')

  [ -n "$cid" ] && docker logs "$cid" -f
}

drm() {
  local cid
  cid=$(docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}" | sed 1d \
  | fzf --multi -1 -q "$1" | awk '{print $1}')

	if [[ $cid ]]; then
      for dockerId in $(echo $cid);
      	  [ -n "$cid" ] && docker rm -f "$dockerId"
    fi
}
