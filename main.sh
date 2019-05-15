#!/bin/bash
clear >$(tty)
echo -n "Do you wish to continue with setup? type either of (y/Y/yes/Yes/YES) to continue "
read answer

if ! [[ "$answer" =~ ^("y"|"Y"|"yes"|"Yes"|"YES")$ ]]; then
	echo "ABORTING"
	exit
else
	echo
	echo 'EXECUTING SETUP SCRIPTS'
	WORK_DIR=${PWD}

	SCRIPT_DIR=${WORK_DIR}/setup_scripts

	echo "    - CURRENT WORK DIR: $WORK_DIR"


	function split_line {
	echo
	echo '--------------------------'
	echo
	}

	split_line

	#--- NEOVIM ----
	echo "RUNNING NEOVIM SCRIPTS"
	bash ${SCRIPT_DIR}/nvim/nvim_move_inits.sh ${WORK_DIR}
	bash ${SCRIPT_DIR}/nvim/nvim_plug_install.sh

	split_line


	#---- NVIM PLUGINS -----
	echo "INSTALLING NVIM PLUGINS USING PLUG"
	nvim +PlugInstall +qall > /dev/null
	echo DONE

	split_line

	#--- TMUX ----
	echo "RUNNING TMUX SCRIPTS"
	bash ${SCRIPT_DIR}/tmux/tmux_move_inits.sh ${WORK_DIR}


	split_line

	#--- BASH ----
	echo "RUNNING BASH SCRIPTS"
	bash ${SCRIPT_DIR}/bash/bash_move_inits.sh ${WORK_DIR}
	echo
fi
