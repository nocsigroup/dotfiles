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

zplugin light "zsh-users/zsh-history-substring-search"

# diff-so-fancy
zplugin ice wait"2" lucid as"program" pick"bin/git-dsf"
zplugin load zdharma/zsh-diff-so-fancy

# zsh-startify, a vim-startify like plugin
zplugin ice wait"0b" lucid atload"zsh-startify"
zplugin load zdharma/zsh-startify

# ZUI and Crasis
zplugin ice wait"1" lucid
zplugin load zdharma/zui

zplugin ice wait'[[ -n ${ZLAST_COMMANDS[(r)cra*]} ]]' lucid
zplugin load zdharma/zplugin-crasis

zplugin ice wait lucid blockf atpull'zplugin creinstall -q .'
zplugin light zsh-users/zsh-completions

zplugin ice wait"1" lucid atinit"ZPLGM[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting

zplugin ice wait"!0" lucid atload"_zsh_autosuggest_start"
zplugin light "zsh-users/zsh-autosuggestions"
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=10

zplugin ice from"gh-r" as"program"
zplugin light "junegunn/fzf-bin"

zplugin ice wait"2" lucid from"gh-r" as"program" mv"exa* -> exa"
zplugin light ogham/exa

zplugin ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zplugin light trapd00r/LS_COLORS

zplugin ice from"gh-r" as"program" mv"docker-compose* -> docker-compose"
zplugin light docker/compose

zplugin ice from"gh-r" as"program" mv"docker-machine* -> docker-machine"
zplugin light docker/machine

zplugin ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' pick"direnv" src"zhook.zsh"
zplugin light direnv/direnv

zplugin ice from"gh-r" as"program" mv"shfmt* -> shfmt"
zplugin light mvdan/sh

zplugin ice atclone"./libexec/pyenv init - > zpyenv.zsh" \
    atinit'export PYENV_ROOT="$PWD"' atpull"%atclone" \
    as'command' pick'bin/pyenv' src"zpyenv.zsh" nocompile'!'
zplugin light pyenv/pyenv

zplugin ice as"command" wait lucid \
    atinit"export PYTHONPATH=$ZPFX/lib/python3.7/site-packages/" \
    atclone"PYTHONPATH=$ZPFX/lib/python3.7/site-packages/ \
    python3 setup.py --quiet install --prefix $ZPFX" \
    atpull'%atclone' test'0' \
    pick"$ZPFX/bin/asciinema"
zplugin load asciinema/asciinema.git

zplugin ice depth="1" as"program" atclone'./install.sh $ZPFX $ZPFX' atpull"%atclone" compile"grc.zsh" src"grc.zsh" pick'$ZPFX/bin/grc*'
zplugin light garabik/grc

zplugin ice lucid wait"!0" 
zplugin light "lukechilds/zsh-nvm"

#
# Completions
# 

zplugin ice as"completion"
zplugin snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

zplugin ice as"completion" id-as"dc-completion"
zplugin load docker/compose

zplugin ice as"completion" id-as"dm-completion"
zplugin load docker/machine

#
# Snippets
#

zplugin ice svn
zplugin snippet OMZ::plugins/osx

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_USE_ASYNC=true

#
# Themes
#
#GEOMETRY_COLOR_DIR=152
#zplugin ice wait"0" lucid atload"prompt_geometry_render"
#zplugin light geometry-zsh/geometry

zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light "sindresorhus/pure"

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

#if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
#if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
[[ -s "$HOME/.kerl/21.2/activate" ]] && source "$HOME/.kerl/21.2/activate"
[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fpath=($HOME/.config/fpath $fpath)
#zprof

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

