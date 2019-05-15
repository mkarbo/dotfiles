#!/bin/bash

mkdir -p ~/.config/bash/

BASH_CONF=$1/config/bash/bash_init.sh

echo "${BASH_CONF}"

echo "MOVING BASH INIT FILES"
cp $BASH_CONF ~/.config/bash/
echo "moved $file to ~/.config/bash/"
ln -sf ~/.config/bash/bash_init ~/.bashrc
