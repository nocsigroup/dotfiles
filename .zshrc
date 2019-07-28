#zmodload zsh/zprof
export PATH="$HOME/.bin:/usr/local/bin:/usr/local/sbin:$(getconf PATH)"
if [[ ! -f "$HOME/.zplugin/bin/zplugin.zsh" ]]; then if (( $+commands[git] )); then
    git clone https://github.com/zdharma/zplugin.git ~/.zplugin/bin
  else
    echo 'git not found' >&2
    exit 1
  fi
fi
source "$HOME/.zplugin/bin/zplugin.zsh"

autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

NVM_LAZY_LOAD=true

zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light "sindresorhus/pure"

zplugin ice wait"!0" lucid blockf
zplugin light "zsh-users/zsh-completions"

zplugin light "zsh-users/zsh-history-substring-search"

zplugin ice wait"!0" lucid atload"_zsh_autosuggest_start"
zplugin light "zsh-users/zsh-autosuggestions"

zplugin ice from"gh-r" as"program"
zplugin light "junegunn/fzf-bin"

zplugin ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!'
zplugin light trapd00r/LS_COLORS

zplugin ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' pick"direnv" src"zhook.zsh"
zplugin light direnv/direnv

zplugin ice depth="1" as"program" atclone'./install.sh $ZPFX $ZPFX' atpull"%atclone" compile"grc.zsh" src"grc.zsh" pick'$ZPFX/bin/grc*'
zplugin light garabik/grc

zplugin ice lucid wait"!0" 
zplugin light "lukechilds/zsh-nvm"

zplugin ice wait"!0" lucid atinit"zpcompinit; zpcdreplay"
zplugin light "zdharma/fast-syntax-highlighting"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_USE_ASYNC=true


SYMBOLS=(
"λ"
"ϟ"
"▲"
"∴"
"→"
"»"
)

zstyle :prompt:pure:path color white
PURE_PROMPT_SYMBOL="${SYMBOLS[$RANDOM % ${#SYMBOLS[@]} + 1]}"

source $HOME/.exports
source $HOME/.aliases

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
[[ -s "$HOME/.kerl/21.2/activate" ]] && source "$HOME/.kerl/21.2/activate"
[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fpath=($HOME/.config/fpath $fpath)
#zprof

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

