#zmodload zsh/zprof
export PATH="$HOME/.bin:/usr/local/bin:/usr/local/sbin:$(getconf PATH)"
if [[ ! -f "$HOME/.zinit/bin/zinit.zsh" ]]; then if (( $+commands[git] )); then
    git clone https://github.com/zdharma/zinit.git ~/.zinit/bin
  else
    echo 'git not found' >&2
    exit 1
  fi
fi
source "$HOME/.zinit/bin/zinit.zsh"

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

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

NVM_LAZY_LOAD=true

#zinit light "zsh-users/zsh-history-substring-search"

# diff-so-fancy
zinit ice wait"2" lucid as"program" pick"bin/git-dsf"
zinit load zdharma/zsh-diff-so-fancy

# zsh-startify, a vim-startify like plugin
zinit ice wait"0b" lucid atload"zsh-startify"
zinit load zdharma/zsh-startify

# zinit light zdharma/z-p-submods

# ZUI and Crasis
zinit ice wait"1" lucid
zinit load zdharma/zui

zstyle ":history-search-multi-word" page-size "11"
zinit ice wait"1" lucid
zinit load zdharma/history-search-multi-word

zinit ice wait'[[ -n ${ZLAST_COMMANDS[(r)cra*]} ]]' lucid
zinit load zdharma/zinit-crasis

zinit ice wait lucid blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

#zinit ice wait"1" lucid atinit"ZPLGM[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay"
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting

# Plugin history-search-multi-word loaded with investigating.
zinit load zdharma/history-search-multi-word

# Load the pure theme, with zsh-async library that's bundled with it.
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

# A glance at the new for-syntax – load all of the above
# plugins with a single command. For more information see:
# https://zdharma.org/zinit/wiki/For-Syntax/
zinit for \
    light-mode  zsh-users/zsh-autosuggestions \
    light-mode  zdharma/fast-syntax-highlighting \
                zdharma/history-search-multi-word \
    light-mode pick"async.zsh" src"pure.zsh" \
                sindresorhus/pure
#
# Binaries
#

# sharkdp/fd
#zinit ice as"command" from"gh-r" mv"fd* -> fd" pick"fd/fd"
#zinit light sharkdp/fd

# sharkdp/bat
#zinit ice as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat"
#zinit light sharkdp/bat

# Binary release in archive, from GitHub-releases page.
# After automatic unpacking it provides program "fzf".
zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin

# ogham/exa, replacement for ls
zinit ice wait"2" lucid from"gh-r" as"program" mv"exa* -> exa"
zinit light ogham/exa

# All of the above using the for-syntax and also z-a-bin-gem-node annex
#zinit wait"1" lucid from"gh-r" as"null" for \
#     sbin"fzf"          junegunn/fzf-bin \
#     sbin"**/fd"        @sharkdp/fd \
#     sbin"**/bat"       @sharkdp/bat \
#     sbin"exa* -> exa"  ogham/exa

export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=10

# For GNU ls (the binaries can be gls, gdircolors, e.g. on OS X when installing the
# coreutils package from Homebrew; you can also use https://github.com/ogham/exa)
zinit ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!'
zinit light trapd00r/LS_COLORS

#
# Binaries
#
zinit ice wait"2" lucid from"gh-r" as"program" mv"docker-credential-helpers* -> docker-credential-helpers"
zinit light docker/docker-credential-helpers

zinit ice wait"2" lucid from"gh-r" as"program" mv"docker-compose* -> docker-compose"
zinit light docker/compose

zinit ice lucid from"gh-r" as"program" mv"docker-machine* -> docker-machine"
zinit light docker/machine

zinit ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' src"zhook.zsh"
zinit light direnv/direnv

zinit ice from"gh-r" as"program" mv"shfmt* -> shfmt"
zinit light mvdan/sh

zinit ice atclone"PYENV_ROOT='$PWD' ./libexec/pyenv init - > zpyenv.zsh && git clone https://github.com/pyenv/pyenv-vir" \
    atinit'export PYENV_ROOT="$PWD"' atpull"%atclone" \
    as'command' pick'bin/pyenv' src"zpyenv.zsh" nocompile'!'
zinit light pyenv/pyenv

zinit ice as"command" wait lucid \
    atinit"export PYTHONPATH=$ZPFX/lib/python3.9/site-packages/" \
    atclone"PYTHONPATH=$ZPFX/lib/python3.9/site-packages/ \
    python3 setup.py --quiet install --prefix $ZPFX" \
    atpull'%atclone' test'0' \
    pick"$ZPFX/bin/asciinema"
zinit load asciinema/asciinema.git

zinit ice depth="1" as"program" atclone'./install.sh $ZPFX $ZPFX' atpull"%atclone" compile"grc.zsh" src"grc.zsh" pick'$ZPFX/bin/grc*'
zinit light garabik/grc

zinit ice lucid wait"!0"
zinit light "lukechilds/zsh-nvm"

#
# Completions
#

# zinit ice as"completion"
# zinit snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

zinit ice as"completion" id-as"dc-completion"
zinit load docker/compose

zinit ice as"completion" id-as"dm-completion"
zinit load docker/machine

#
# Plugins
#

zinit ice pick"h.sh"
zinit light paoloantinori/hhighlighter

#
# Snippets
#

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_USE_ASYNC=true

#
# Themes
#

zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

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

[[ -s "$HOME/.kerl/23.2.2/activate" ]] && source "$HOME/.kerl/23.2.2/activate"
[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fpath=($HOME/.config/fpath $fpath)
