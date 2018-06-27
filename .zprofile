if [[ ! -e "$SSH_AUTH_SOCK" || "$SSH_AUTH_SOCK" == *"launchd"* ]]; then
  source $HOME/.ssh/agent.env > /dev/null
fi

GPG_TTY=$(tty)
export GPG_TTY
if [ -z "$GPG_AGENT_INFO" ]; then
  eval "$(gpg-agent --daemon --options ~/.gnupg/gpg-agent.conf)"
fi

export MANPAGER='less -s -M +Gg'
export LESS="--RAW-CONTROL-CHARS"
lesscolors=$HOME/.bin/LESS_TERMCAP
[[ -f $lesscolors ]] && . $lesscolors
