export PATH=${PATH}:"${HOME}/.local/bin"

if uwsm check may-start && [ ! -e ~/.cache/.hyprland_launched ]; then
  touch ~/.cache/.hyprland_launched
  exec uwsm start hyprland-uwsm.desktop
elif type fish 1>/dev/null 2>/dev/null; then
  exec fish
else
  exec bash
fi
