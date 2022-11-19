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
- fish
- task (for simple task management)
- neovim

## Fish

Add `.local/bin` to path with `fish_add_path -a ~/.local/bin`.

## neovim

Add vim-plug (`plug.vim`) to `/home/martin/.local/share/nvim/site/autoload`.
Start nvim and run `:PlugUpdate`.

## sway

Terminal: foot  
Menu: fuzzel  
Status bar: i3status-rust  
Notification daemon: mako  

