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

zplugin light "lukechilds/zsh-nvm"
zplugin ice pick"async.zsh" src"pure.zsh"; zplugin light "ahmedelgabri/pure"
zplugin light "zsh-users/zsh-history-substring-search"

zplugin ice wait"1" lucid atload"_zsh_autosuggest_start"
zplugin light "zsh-users/zsh-autosuggestions"

zplugin ice wait"0" lucid blockf
zplugin light "zsh-users/zsh-completions"

zplugin ice from"gh-r" as"program"
zplugin light "junegunn/fzf-bin"

zplugin ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' pick"direnv" src"zhook.zsh"
zplugin light "direnv/direnv"

zplugin ice depth="1" as"program" atclone'./install.sh $ZPFX $ZPFX' atpull"%atclone" compile"grc.zsh" src"grc.zsh" pick'$ZPFX/bin/grc*'
zplugin light garabik/grc

zplugin ice wait'1' lucid
zplugin load gpg

zplugin ice wait"0" lucid atinit"zpcompinit; zpcdreplay"
zplugin light "zdharma/fast-syntax-highlighting"

ZSH_AUTOSUGGEST_USE_ASYNC=true

SYMBOLS=(
"λ"
"ϟ"
"▲"
"∴"
"→"
"»"
)

export PURE_PROMPT_SYMBOL="${SYMBOLS[$RANDOM % ${#SYMBOLS[@]} + 1]}"

source $HOME/.exports
source $HOME/.aliases

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

nixify() {
  if [ ! -e ./.envrc ]; then
    echo "use nix" > .envrc
    direnv allow
  fi
  if [ ! -e default.nix ]; then
    cat > default.nix <<'EOF'
with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "env";
  buildInputs = [
    bashInteractive
  ];
}
EOF
    ${EDITOR:-vim} default.nix
  fi
}

#if [ -x /usr/libexec/path_helper ]; then
#    eval `/usr/libexec/path_helper -s`
#fi
#zprof

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
