#!/bin/bash

# Inspired by :
# https://github.com/mathiasbynens/dotfiles/blob/master/bootstrap.sh
# https://github.com/aaronjensen/vimfiles/blob/master/setup.sh
# https://raw.github.com/kepbod/ivim/master/tools/bootstrap.sh

# note our base directory location
DOTFILE_DIR=$( cd `dirname $0` >/dev/null; pwd -P )

function warn() {
    printf '\033[0;31m%s\033[0m\n' "$1" >&2
}

function die() {
    warn "$1"
    exit 1
}

function note() {
    printf '\033[0;34m%s\033[0m\n' "$1"
}

function setup_symlinks() {
    # original vim/nvim config (VimL-based)
    ln -vs $DOTFILE_DIR/vimrc $HOME/.vimrc
    ln -vs $DOTFILE_DIR/init.vim $HOME/.config/nvim/init.vim
    ln -vs $DOTFILE_DIR/vim $HOME/.vim

    # screen configs
#    ln -vs $DOTFILE_DIR/screenrc $HOME/.screenrc

    # setup the bash git prompt -- now comes with the lastest version of git
#    ln -vs $DOTFILE_DIR/bash/utils/git-prompt/git-prompt.sh $HOME/.git-prompt.sh

    # bash command history logging...
    ln -vs $DOTFILE_DIR/bash/utils/bash-preexec/bash-preexec.sh \
        $HOME/.bash-preexec.sh

    os=$(uname)

    # bashrc and tmux configs
    if [ "$os" == "Linux" ]; then
        ln -vs $DOTFILE_DIR/bashrc-tgi-linux $HOME/.bashrc
    	ln -vs $DOTFILE_DIR/tmux-linux.conf $HOME/.tmux.conf
    elif [[ "$os" == "Darwin" ]] && [[ $HOSTNAME =~ "mini" ]]; then
        ln -sv $DOTFILE_DIR/bashrc-osx $HOME/.bashrc
    	ln -vs $DOTFILE_DIR/tmux-osx.conf $HOME/.tmux.conf
    elif [ "$os" == "Darwin" ]; then
        ln -sv $DOTFILE_DIR/bashrc-osx-tgi-laptop $HOME/.bashrc
    	ln -vs $DOTFILE_DIR/tmux-osx.conf $HOME/.tmux.conf
    fi

    # profile configs
    if [ "$os" == "Darwin" ]; then
        ln -sv $DOTFILE_DIR/profile-osx $HOME/.profile
    fi

#    # clojure/lein configs
#    ln -vs $DOTFILE_DIR/lein $HOME/.lein

#    # clojure/clj-tools configs
#    ln -vs $DOTFILE_DIR/clojure $HOME/.clojure
}

function setup_bash_utils() {
    # bash preexec logging
    git clone git://github.com/rcaloras/bash-preexec.git \
        $DOTFILE_DIR/bash/utils/bash-preexec
}

function setup_logging_directory() {
    CMD_LOGS_DIR=$HOME/.logs
    if [ ! -d "$CMD_LOGS_DIR" ]; then
        note "--> creating logging directory $CMD_LOGS_DIR"
        mkdir -p $CMD_LOGS_DIR
    fi
}

function bootUp() {
    note "setup bash utilities"
    setup_bash_utils

    note "setup logging"
    setup_logging_directory

    note "Re-making symlink directories..."
    setup_symlinks

#    note "rsync-ing remaining dotfiles..."
#    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" -av . ~

    note "dotfile setup complete!"
}

cd $DOTFILE_DIR

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    bootUp
else 
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo 
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        bootUp
    fi
fi

unset bootUp
unset warn
unset die
unset note
