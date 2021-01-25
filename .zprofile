#if [[ ! -e "$SSH_AUTH_SOCK" || "$SSH_AUTH_SOCK" == *"launchd"* ]]; then
#  SSH_AUTH_SOCK=$HOME/.ssh/pivy-agent.sock; export SSH_AUTH_SOCK;
#fi
#
export SSH_AUTH_SOCK=/Users/locnguyen/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh

#export MANPAGER='less -s -M +Gg'
#export LESS="--RAW-CONTROL-CHARS"
#lesscolors=$HOME/.bin/LESS_TERMCAP
#[[ -f $lesscolors ]] && . $lesscolors
