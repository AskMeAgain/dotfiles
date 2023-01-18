if type "xrandr"; then
  for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload example &
  done
else
  polybar --reload orchid &
fi