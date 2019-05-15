#!/bin/bash


WORK_DIR=${PWD}

SCRIPT_DIR=${WORK_DIR}/setup_scripts

echo "$WORK_DIR"


#--- NEOVIM ----
echo "RUNNING NEOVIM SCRIPTS"
echo
bash ${SCRIPT_DIR}/nvim/nvim_move_inits.sh ${WORK_DIR}
bash ${SCRIPT_DIR}/nvim/nvim_plug_install.sh


#---- NVIM PLUGINS -----
echo "INSTALLING NVIM PLUGINS USING PLUG"
echo
nvim +PlugInstall +qall > /dev/null

#--- TMUX ----
echo "RUNNING TMUX SCRIPTS"
echo
bash ${SCRIPT_DIR}/tmux/tmux_move_inits.sh ${WORK_DIR}



#--- BASH ----
echo "RUNNING BASH SCRIPTS"
echo
bash ${SCRIPT_DIR}/bash/bash_move_inits.sh ${WORK_DIR}
