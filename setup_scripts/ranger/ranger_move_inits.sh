#!/bin/bash

mkdir -p ~/.config/ranger/
mkdir -p ~/.config/ranger/colorschemes

RANGER_COLORPATH=$1/config/ranger/colorschemes/*
RANGER_CONF=$1/config/ranger/rc.conf

echo "${RANGER_CONF}"

echo "MOVING RANGER INIT FILES"
cp $RANGER_CONF ~/.config/ranger/
echo -e " - moved \e[96m$RANGER_CONF\e[0m to ~/.config/ranger/"

for file in $RANGER_COLORPATH
do
	cp $file ~/.config/ranger/colorschemes/
	echo -e " - moved \e[96m$file\e[0m to ~/.config/ranger/colorschemes/"
done

