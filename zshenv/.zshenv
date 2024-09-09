#!/usr/bin/env zsh

export DOTFILES="$HOME/git/dotfiles"

# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache
export XDG_BIN_HOME=$HOME/.local/bin
export XDG_MUSIC_DIR=$HOME/Media/Music
export XDG_PICTURES_DIR=$HOME/Media/Pictures

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# zsh (initials)
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export HISTFILE=$HOME/.zhistory
export HISTSIZE=10000
export SAVEHIST=10000
