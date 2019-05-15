#!/bin/bash
clear >$(tty)
echo -e "Do you wish to continue with setup? type either of \e[4m(y/Y/yes/Yes/YES)\e[0m to continue "
read answer


function split_line {
echo
echo -e '\e[2m\e[32m--------------------------\e[0m'
echo
}




if ! [[ "$answer" =~ ^("y"|"Y"|"yes"|"Yes"|"YES")$ ]]; then
	echo "ABORTING"
	exit
else
	split_line

	echo -e 'running \e[96mapt-get update\e[0m. This could take some time..'
	apt-get update

	split_line
	
	echo -e 'running \e[96mapt-get install python3.6 -y\e[0m to install python3. '
	apt-get install python3.6 -y
	
	split_line
	
	echo -e 'running \e[96mapt-get install python3-pip -y\e[0m to install pip for python3. '
	apt-get install python3-pip -y

	split_line
	
	echo -e 'running \e[96mapt-get install nvim -y\e[0m to install neovim. '
	apt-get install nvim -y

	split_line

	echo -e 'running \e[96mapt-get install ranger -y\e[0m to install ranger file manager. '
	apt-get install ranger -y

	split_line

	echo 'EXECUTING SETUP SCRIPTS'
	WORK_DIR=${PWD}

	SCRIPT_DIR=${WORK_DIR}/setup_scripts

	echo "    - CURRENT WORK DIR: $WORK_DIR"



	split_line

	#--- NEOVIM ----
	echo -e "\e[96mRUNNING NEOVIM SCRIPTS\e[0m"
	bash ${SCRIPT_DIR}/nvim/nvim_move_inits.sh ${WORK_DIR}
	bash ${SCRIPT_DIR}/nvim/nvim_plug_install.sh

	split_line


	#---- NVIM PLUGINS -----
	echo -e "\e[96mINSTALLING NVIM PLUGINS USING PLUG\e[0m"
	nvim +PlugInstall +qall > /dev/null
	echo DONE

	split_line

	#--- TMUX ----
	echo -e "\e[96mRUNNING TMUX SCRIPTS\e[0m"
	bash ${SCRIPT_DIR}/tmux/tmux_move_inits.sh ${WORK_DIR}


	split_line

	#--- BASH ----
	echo -e "\e[96mRUNNING BASH SCRIPTS\e[0m"
	bash ${SCRIPT_DIR}/bash/bash_move_inits.sh ${WORK_DIR}
	echo

	split_line

	#--- RANGER ----
	echo -e "\e[96mRUNNING RANGER SCRIPTS\e[0m"
	bash ${SCRIPT_DIR}/ranger/ranger_move_inits.sh ${WORK_DIR}
	echo

	split_line

	#--- RANGER ----
	echo -e "\e[96mRUNNING PIP INSTALL SCRIPTS\e[0m"
	bash ${SCRIPT_DIR}/python/pip_installs.sh ${WORK_DIR}
	echo
fi
