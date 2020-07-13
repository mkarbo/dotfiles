#!/bin/bash
clear >$(tty)

function ask() {
	local __TEXT_INPUT=$1
	read -p "$(echo -e "$__TEXT_INPUT")" __OUTPUT
	echo $__OUTPUT
}

answer=$(ask "Do you wish to continue with setup? type either of \e[4m(y/Y/yes/Yes/YES)\e[0m to continue ")

_username=$(ask "Please type your username (script is run using ${USER}) to change ownership of ~/.local, ~/.config, ~/.vim to this user. Type nothing to ignore ")

function split_line {
echo
echo -e '\e[2m\e[32m--------------------------\e[0m'
echo
}

if ! [[ "$answer" =~ ^("y"|"Y"|"yes"|"Yes"|"YES")$ ]]; then
	echo "ABORTING"
	exit
else
	if [ -z ${_username+x} ]; then
		split_line

		echo -e 'running \e[96mchown -R ~/.config \e[0m. This could take some time..'
		chown -R ${_username} ~/.config

		split_line

		echo -e 'running \e[96mchown -R ~/.local \e[0m. This could take some time..'
		chown -R ${_username} ~/.local

		split_line

		echo -e 'running \e[96mchown -R ~/.vim \e[0m. This could take some time..'
		chown -R ${_username} ~/.vim
	fi

	split_line


	echo -e 'running \e[96mapt-get update\e[0m. This could take some time..'
	apt-get update

	split_line
	
	
	echo -e 'running \e[96mapt-get install python3 -y\e[0m to install python3. '
	apt-get install python3 -y

	split_line

	echo -e 'running \e[96mapt-get install python3-pip -y\e[0m to install pip for python3. '
	apt-get install python3-pip -y

	split_line
	
	echo 'running'
	echo -e ' - \e[96mapt-get install software-properties-common -y; add-apt-repository ppa:neovim-ppa/stable -y; apt-get update -y\e[0m'
	echo 'to install neovim dependencies. '

	apt-get install software-properties-common -y; add-apt-repository ppa:neovim-ppa/stable -y; apt-get update -y
	

	split_line
	
	echo -e 'running \e[96mapt-get install nvim -y\e[0m to install neovim. '
	apt-get install neovim -y


	echo 'EXECUTING SETUP SCRIPTS'
	WORK_DIR=${PWD}

	SCRIPT_DIR=${WORK_DIR}/setup_scripts

	echo "    - CURRENT WORK DIR: $WORK_DIR"



	split_line
	
	#--- GIT CONFIG ----
	bash ${SCRIPT_DIR}/git/git_config.sh

	split_line

	#--- NEOVIM ----
	echo -e "\e[96mRUNNING NEOVIM SCRIPTS\e[0m"
	bash ${SCRIPT_DIR}/nvim/nvim_move_inits.sh ${WORK_DIR}
	bash ${SCRIPT_DIR}/nvim/nvim_plug_install.sh

	split_line


	#---- NVIM PLUGINS -----
	echo -e "\e[96mINSTALLING NVIM PLUGINS USING VUNDLE\e[0m"
	nvim +PluginInstall +qall > /dev/null
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

fi
