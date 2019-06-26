#!/bin/bash

mkdir -p ~/.config/bash/

BASH_CONF=$1/config/bash/bash_init.sh

echo "${BASH_CONF}"

echo "MOVING BASH INIT FILES"
cp $BASH_CONF ~/.config/bash/
echo -e " - moved \e[96m${BASH_CONF}\e[0m to ~/.config/bash/"
ln -sf ~/.config/bash/bash_init.sh ~/.bashrc

BASH_FUNCTIONS=$1/config/bash/bash_functions.sh

echo "${BASH_FUNCTIONS}"

cp $BASH_FUNCTIONS ~/.config/bash/
echo -e " - moved \e[96m${BASH_FUNCTIONS}\e[0m to ~/.config/bash/"

echo "EXPORTING VISUAL=nvim and EDITOR=\"\$VISUAL\""
export VISAUL=nvim
export EDITOR="$VISUAL"

