#!/bin/bash

# List of available scripts
options="vim\nmpv-input\nmpv\nsxhkd\nxbindkeys\ndunst\nbash\nzsh\nnewsboat\ntmux\nxinitrc\nxbindkeys"
path="/media/terakek/repos/configs"
# Use dmenu to select a script
selection=$(echo -e "$options" | dmenu -i -p "Select a script:")

# Execute the chosen script
case "$selection" in
    "vim") st -e vim $path/vim/.vimrc > /dev/null 2>&1 ;;  
    "mpv-input") st -e vim $path/mpv/input.conf > /dev/null 2>&1 ;;  
    "mpv") st -e vim $path/mpv/mpv.conf > /dev/null 2>&1 ;;  
    "sxhkd") st -e vim $path/sxhkd/sxhkdrc > /dev/null 2>&1 ;;  
    "xbindkeys") st -e vim $path/xbindkeys/.xbindkeysrc > /dev/null 2>&1 ;;  
    "dunst") st -e vim $path/dunst/dunstrc > /dev/null 2>&1 ;;  
    "bash") st -e vim $path/bash/.bashrc > /dev/null 2>&1 ;;  
    "zsh") st -e vim $path/zsh/.zshrc > /dev/null 2>&1 ;;  
    "newsboat") st -e vim $path/newsboat/config > /dev/null 2>&1 ;;  
    "tmux") st -e vim $path/tmux/.tmux.conf > /dev/null 2>&1 ;;  
    "xinitrc") st -e vim $path/xinit/.xinitrc > /dev/null 2>&1 ;;  
    "xbindkeys") st -e vim $path/xinit/.xbindkeysrc > /dev/null 2>&1 ;;  
esac

