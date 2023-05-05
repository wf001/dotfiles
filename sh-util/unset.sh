#!/bin/sh -x

rm -rf ~/.config/nvim 
rm -rf ~/.local/share/nvim 

unlink ~/.zshrc 
unlink ~/.zshrc.local 

unlink ~/.tmux.conf 

unlink ~/.gitconfig 
rm -f ~/.gitconfig.local

unlink ~/bin/create-venv.sh

