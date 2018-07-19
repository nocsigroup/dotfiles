if [[ ! -e "$SSH_AUTH_SOCK" || "$SSH_AUTH_SOCK" == *"launchd"* ]]; then
  source $HOME/.ssh/agent.env > /dev/null
fi

export MANPAGER='less -s -M +Gg'
export LESS="--RAW-CONTROL-CHARS"
lesscolors=$HOME/.bin/LESS_TERMCAP
[[ -f $lesscolors ]] && . $lesscolors
