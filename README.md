# `home` backup

Repo containing a few config files that I use across my different machines.

Currently used for one AMD desktop and one Intel (Dell XPS) laptop. Both run Arch Linux.

A few packages used:

- sway
- fuzzel
- wf-recorder
- swappy (editing image)
- wl-clipboard
- slurp (for selecting parts of the screen)
- grim (taking screenshot)
- i3status-rust
- mako (notifications in sway)
- lxsession (escalate permission?)
- libnotify
- fish
- task (for simple task management)

## Fish

Add `.local/bin` to path with `fish_add_path -a ~/.local/bin`.

## vim

It should be enough to copy/link `.vim/autoload` and then open vim and run `:PlugUpdate`.
The plugins should then be installed to `.vim/plugged`. Restart vim and then good to go.

## sway

Terminal: foot  
Menu: wofi  
Status bar: i3status-rust  
Notification daemon: mako  

