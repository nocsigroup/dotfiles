export PATH="$HOME/.bin:/usr/local/bin:/usr/local/sbin:$HOME/.mix:$(getconf PATH)"
source $HOME/.antigen/antigen.zsh
export ZSH=$HOME/.oh-my-zsh
export ZSH_TMUX_AUTOSTART="true"
export ZSH_CACHE_DIR=$HOME/.zsh
export ZSH_AUTOSUGGEST_USE_ASYNC="true"
export SPACESHIP_ROOT="$HOME/.antigen/bundles/denysdovhan/spaceship-prompt"
export DISABLE_UNTRACKED_FILES_DIRTY="true"

antigen use oh-my-zsh
antigen bundle mafredri/zsh-async
antigen bundle zsh-users/zsh-autosuggestions 
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme https://github.com/denysdovhan/spaceship-prompt spaceship
antigen apply

SPACESHIP_PROMPT_ORDER=(
  time     #
  user     # before prompt char
  host     #
  exit_code
  char
  git
  dir
  elixir
  haskell
  dotnet
  node
  rust
  haskell
  golang
  docker
  venv
  pyenv
)
SPACESHIP_CHAR_SYMBOL=λ
SPACESHIP_CHAR_COLOR_SUCCESS="green"
SPACESHIP_CHAR_COLOR_FAILURE="red"
SPACESHIP_CHAR_COLOR_SECONDARY="yellow"
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_PROMPT_DEFAULT_PREFIX=" "
SPACESHIP_PROMPT_DEFAULT_SUFFIX=" "

SPACESHIP_DIR_SHOW=true
SPACESHIP_DIR_PREFIX=""
SPACESHIP_DIR_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_DIR_TRUNC=3
SPACESHIP_DIR_COLOR="yellow"
source $HOME/.exports
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.aliases
source $HOME/.triton.completion

if [[ -a "$HOME/.iterm2_shell_integration.zsh" ]]; then
    source "$HOME/.iterm2_shell_integration.zsh"
fi

if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi

[[ -s "/usr/local/etc/grc.zsh" ]] && source /usr/local/etc/grc.zsh

[ -f '$HOME/.fzf.zsh' ] && source '$HOME/.fzf.zsh'
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
export DIRENV_BASH=/usr/local/bin/bash
if [ -x "$(which direnv)" ]; then
  eval "$(direnv hook zsh)"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
