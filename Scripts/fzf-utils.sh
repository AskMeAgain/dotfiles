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