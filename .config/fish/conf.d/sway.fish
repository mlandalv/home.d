# https://github.com/swaywm/sway/wiki
# If running from tty1 start sway
set TTY1 (tty)
[ "$TTY1" = "/dev/tty1" ] && exec sway-run

