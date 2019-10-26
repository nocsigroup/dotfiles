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

typeset -g HISTSIZE=290000 SAVEHIST=290000 HISTFILE=~/.zhistory ABSD=${${(M)OSTYPE:#*(darwin|bsd)*}:+1}

typeset -ga mylogs
zflai-msg() { mylogs+=( "$1" ); }
zflai-assert() { mylogs+=( "$4"${${${1:#$2}:+FAIL}:-OK}": $3" ); }

#
# Setopts
#

setopt interactive_comments hist_ignore_dups  octal_zeroes   no_prompt_cr  notify
setopt no_hist_no_functions no_always_to_end  append_history list_packed
setopt inc_append_history   complete_in_word  no_auto_menu   auto_pushd
setopt pushd_ignore_dups    no_glob_complete  no_glob_dots   c_bases
setopt numeric_glob_sort    no_share_history  promptsubst    auto_cd
setopt rc_quotes            extendedglob

#
# Bindkeys
#

autoload up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey -v
[[ -n "$terminfo[kpp]"   ]] && bindkey "$terminfo[kpp]"   up-line-or-beginning-search   # PAGE UP
[[ -n "$terminfo[knp]"   ]] && bindkey "$terminfo[knp]"   down-line-or-beginning-search # PAGE DOWN
[[ -n "$terminfo[khome]" ]] && bindkey "$terminfo[khome]" beginning-of-line             # HOME
[[ -n "$terminfo[kend]"  ]] && bindkey "$terminfo[kend]"  end-of-line                   # END
[[ -n "$terminfo[kdch1]" ]] && bindkey "$terminfo[kdch1]" delete-char                   # DELETE
[[ -n "$terminfo[kbs]"   ]] && bindkey "$terminfo[kbs]"   backward-delete-char          # BACKSPACE

bindkey "^A"      beginning-of-line     "^E"      end-of-line
bindkey "^?"      backward-delete-char  "^H"      backward-delete-char
bindkey "^W"      backward-kill-word    "\e[1~"   beginning-of-line
bindkey "\e[7~"   beginning-of-line     "\e[H"    beginning-of-line
bindkey "\e[4~"   end-of-line           "\e[8~"   end-of-line
bindkey "\e[F"    end-of-line           "\e[3~"   delete-char
bindkey "^J"      accept-line           "^M"      accept-line
bindkey "^T"      accept-line           "^R"      history-incremental-search-backward

autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

NVM_LAZY_LOAD=true

#zplugin light "zsh-users/zsh-history-substring-search"

# diff-so-fancy
zplugin ice wait"2" lucid as"program" pick"bin/git-dsf"
zplugin load zdharma/zsh-diff-so-fancy

# zsh-startify, a vim-startify like plugin
zplugin ice wait"0b" lucid atload"zsh-startify"
zplugin load zdharma/zsh-startify

zplugin light zdharma/z-p-submods

# ZUI and Crasis
zplugin ice wait"1" lucid
zplugin load zdharma/zui

zstyle ":history-search-multi-word" page-size "11"
zplugin ice wait"1" lucid
zplugin load zdharma/history-search-multi-word

zplugin ice wait'[[ -n ${ZLAST_COMMANDS[(r)cra*]} ]]' lucid
zplugin load zdharma/zplugin-crasis

zplugin ice wait lucid blockf atpull'zplugin creinstall -q .'
zplugin light zsh-users/zsh-completions

zplugin ice wait"1" lucid atinit"ZPLGM[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting

zplugin ice wait"!0" lucid atload"_zsh_autosuggest_start"
zplugin light "zsh-users/zsh-autosuggestions"
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=10

zplugin ice wait"0c" lucid reset \
    atclone"local P=${${(M)OSTYPE:#*darwin*}:+g}
            \${P}sed -i \
            '/DIR/c\DIR 38;5;63;1' LS_COLORS; \
            \${P}dircolors -b LS_COLORS > c.zsh" \
    atpull'%atclone' pick"c.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zplugin light 'trapd00r/LS_COLORS'

#
# Binaries
#

zplugin ice from"gh-r" as"program"
zplugin light "junegunn/fzf-bin"

zplugin ice wait"2" lucid from"gh-r" as"program" mv"exa* -> exa"
zplugin light ogham/exa

zplugin ice wait"2" lucid from"gh-r" as"program" mv"docker-credential-helpers* -> docker-credential-helpers"
zplugin light docker/docker-credential-helpers

zplugin ice wait"2" lucid from"gh-r" as"program" mv"docker-compose* -> docker-compose"
zplugin light docker/compose

zplugin ice lucid from"gh-r" as"program" mv"docker-machine* -> docker-machine"
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
# Plugins
#

zplugin ice pick"h.sh"
zplugin light paoloantinori/hhighlighter


#
# Snippets
#

# Uses z-p-submods z-plugin: https://github.com/zdharma/z-p-submods
zplugin ice svn submods'zsh-users/zsh-autosuggestions -> external'
zplugin snippet PZT::modules/autosuggestions

zplugin ice svn submods"clvv/fasd -> external"
zplugin snippet PZT::modules/fasd

zplugin ice svn pick"completion.zsh" src"git.zsh"
zplugin snippet OMZ::lib

zplugin ice svn
zplugin snippet OMZ::plugins/osx

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_USE_ASYNC=true

#
# Themes
#

zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure
#zplugin ice ice load'![[ $MYPROMPT = 0 ]]' unload'![[ $MYPROMPT != 0 ]]' \
#             multisrc"{async,pure}.zsh" pick"/dev/null" idas"pure-prompt"
#zplugin load sindresorhus/pure

#GEOMETRY_COLOR_DIR=152
#zplugin ice wait"0" lucid atload"prompt_geometry_render"
#zplugin light geometry-zsh/geometry
#zplugin ice load'![[ $MYPROMPT = 1 ]]' unload'![[ $MYPROMPT != 1 ]]' atload"prompt_geometry_render" lucid
#zplugin load geometry-zsh/geometry

#zplugin light mafredri/zsh-async  # dependency
#zplugin ice svn silent atload'prompt sorin'
#zplugin snippet PZT::modules/prompt

#MYPROMPT=1

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

[[ -s "$HOME/.kerl/21.2/activate" ]] && source "$HOME/.kerl/21.2/activate"
[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fpath=($HOME/.config/fpath $fpath)

MACHINE=default
if [[ $(docker-machine status "$MACHINE" 2>&1) != "Running" ]]; then
  docker-machine start "$MACHINE"
fi
today=$(date +%s)
lastchange=$(stat -f "%m" "$HOME/.docker/$MACHINE")
delta=$((today - lastchange))
if [[ ! -f "$HOME/.docker/$MACHINE" || $delta -gt 3600 ]]; then
  echo $(docker-machine env "$MACHINE") |  >"$HOME/.docker/$MACHINE" > >(eval)
else 
  [[ -s "$HOME/.docker/$MACHINE" ]] && source "$HOME/.docker/$MACHINE"
fi
#
#zprof

#test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

