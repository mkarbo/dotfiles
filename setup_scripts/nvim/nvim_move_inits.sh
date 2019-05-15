#!/bin/bash


mkdir -p ~/.config/nvim

NVIM_PATH=$1/config/nvim/*

echo "MOVING NVIM INIT FILES"

for file in $NVIM_PATH
do
	cp $file ~/.config/nvim/
	echo "moved $file to ~/.config/nvim/"
done

