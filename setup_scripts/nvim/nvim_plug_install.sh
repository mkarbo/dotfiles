#!/bin/bash

function install_plug {
if ! [ -f ~/.local/share/nvim/site/autoload/plug.vim ] ; then
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
}


install_plug
