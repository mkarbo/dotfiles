#!/bin/bash

mkdir -p ~/.config/tmux/

TMUX_CONF=$1/config/tmux/tmux.conf

echo "${TMUX_CONF}"

echo "MOVING TMUX INIT FILES"
cp $TMUX_CONF ~/.config/tmux/
echo "moved $file to ~/.config/tmux/"
ln -sf ~/.config/tmux/tmux.conf ~/.tmux.conf
