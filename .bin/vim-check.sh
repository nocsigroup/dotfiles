
#!/usr/bin/env bash
#
# Collection of various test strings that could be the output of the tmux
# 'pane_current_comamnd' message. Included as regression test for updates to
# the inline grep pattern used in the `.tmux.conf` configuration

set -e

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
NORMAL=$(tput sgr0)

vim_pattern='(^|\/)g?(view|n?vim?)(diff)?$'
match_tests=(vim Vim VIM vimdiff /usr/local/bin/vim vi gvim view gview nvim)
no_match_tests=( /Users/locnguyen/.vim/thing /usr/local/bin/start-vim )

display_matches() {
  for process_name in "$@"; do
    printf "%s %s\n" "$(matches_vim_pattern $process_name)" "$process_name"
  done
}

matches_vim_pattern() {
  if echo "$1" | grep -iqE "$vim_pattern"; then
    echo "${GREEN}match${NORMAL}"
  else
    echo "${RED}fail${NORMAL}"
  fi
}

main() {
  echo "Testing against pattern: ${YELLOW}$vim_pattern${NORMAL}\n"

  echo "These should all ${GREEN}match${NORMAL}\n----------------------"
  display_matches "${match_tests[@]}"

  echo "\nThese should all ${RED}fail${NORMAL}\n---------------------"
  display_matches "${no_match_tests[@]}"
}

main
