#!/bin/bash


mkdir -p ~/.config/nvim

NVIM_PATH=$1/config/nvim/*

echo "MOVING NVIM INIT FILES"

for file in $NVIM_PATH
do
	cp $file ~/.config/nvim/
	echo -e " - moved \e[96m$file\e[0m to ~/.config/nvim/"
done

