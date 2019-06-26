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

function pyvenv() {
pip install pynvim cookiecutter
}

bind 'set mark-symlinked-directories on'

function ps_c () {
GREPPARAM=$1
ps -aux | grep "${GREPPARAM}\|%MEM"
}
