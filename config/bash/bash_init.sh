export TERM=xterm-256color
alias tmux='tmux -2'
alias ls='ls --color=always'


alias la='ls -lah'

alias vim='nvim'

PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '
force_color_prompt=yes

function count() {
DIRPARAM=$1
TYPEPARAM=${2:-f}
numfiles="$(find ./${DIRPARAM} -type ${TYPEPARAM} | wc | awk '{print $1}')"
if [ $TYPEPARAM == f ]; then 
	echo -e "number of files in directory is: \e[96m$numfiles\e[0m"

else
	echo -e "number of type ${TYPEPARAM} in directory is: \e[96m$numfiles\e[0m"
fi
}

