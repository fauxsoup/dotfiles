gnome-settings-daemon &

xsetroot -cursor_name left_ptr
xset r rate 200 60

export VISUAL=emacsclient
export EDITOR="$VISUAL"

exec emacs
