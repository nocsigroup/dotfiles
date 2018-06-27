#!/usr/bin/env bash
# 
#
# Author: Nelson Mandela

if [[ "$1" == "tmux" ]]; then
  window_bottom=$(tmux list-panes -F "#{window_height}" | head -n1)
  window_right=$(tmux list-panes -F "#{window_width}" | head -n1)
  window_bottom=$(($window_bottom - 1))
  window_right=$(($window_right - 1))
  pane=$(tmux list-panes -F "#{pane_left} #{pane_right} #{pane_top} #{pane_bottom} #{pane_active}" | grep '.* 1$')
  pane_left=$(echo "$pane" | cut -d' ' -f 1)
  pane_right=$(echo "$pane" | cut -d' ' -f 2)
  pane_top=$(echo "$pane" | cut -d' ' -f 3)
  pane_down=$(echo "$pane" | cut -d' ' -f 4)
fi


function tmux_up
{
    if [[ $pane_top -eq 0 ]];
    then
        chunkc tiling::window --focus north
    else
        tmux select-pane -U
    fi
}

function tmux_down
{
    if [[ $pane_down -eq $window_bottom ]];
    then
        chunkc tiling::window --focus south
    else
        tmux select-pane -D
    fi
}

function tmux_right
{
    if [[ $pane_right  -eq $window_right ]];
    then
        chunkc tiling::window --focus east
    else
        tmux select-pane -R
    fi
}

function tmux_left
{
  if [[ $pane_left  -eq 0 ]];
  then
    chunkc tiling::window --focus west
  else
    tmux select-pane -L
  fi
}


if [[ "$1" == "chunk" ]];then
    case "$2" in
        'up')
            chunk_up
            ;;
        'down')
            chunk_down
            ;;
        'right')
            chunk_right
            ;;
        'left')
            chunk_left
            ;;
    esac

elif [[ "$1" == "tmux" ]];then
    case "$2" in
        'up')
            tmux_up
            ;;
        'down')
            tmux_down
            ;;
        'right')
            tmux_right
            ;;
        'left')
            tmux_left
            ;;
    esac
  fi
