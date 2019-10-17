#!/bin/bash
function ask() {
	local __TEXT_INPUT=$1
	read -p "$(echo -e "$__TEXT_INPUT")" __OUTPUT
	echo $__OUTPUT
}

echo "Setting up global git config. Please answer some questions"

__CONFIG_GIT=$(ask "Do you want to configure git? (Leave blank to ignore)")

if [ -z ${__CONFIG_GIT+x} ]; then
	__GIT_NAME=$(ask "Name? ")
	__GIT_EMAIL=$(ask "Email? ")
	git config --global user.name "$__GIT_NAME"
	git config --global user.email "$__GIT_EMAIL";
fi
