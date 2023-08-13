if type "xrandr"; then
  for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload orchid1 &
  done
else
  polybar --reload orchid &
fi