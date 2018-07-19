#if [ $TERM ]; then
#  infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > "${HOME}/.theme/${TERM}.ti" && tic "${HOME}/.theme/${TERM}.ti"
#fi
