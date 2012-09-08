#!/bin/bash

# Inspired by :
# https://github.com/mathiasbynens/dotfiles/blob/master/bootstrap.sh
# https://github.com/aaronjensen/vimfiles/blob/master/setup.sh
# https://raw.github.com/kepbod/ivim/master/tools/bootstrap.sh

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
    ln -s $HOME/dotfiles/vimrc $HOME/.vimrc
    ln -s $HOME/dotfiles/vim $HOME/.vim
}

function bootUp() {
    note "Checking vim version..."
    vim --version | grep 7.3 || die "Your vim's version is too low!\nPlease download higher version(7.3+) from http://www.vim.org/download.php"

    # backup noteable existing stuff
    note "Backing up noteable configs..."
    for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do 
        if [ -e $i ]; then
            note "\t * $i"
            mv -f $i $i.backup; 
        fi
    done

    note "Re-making .vim directory..."
    mkdir -p $HOME/.vim/bundle

    setup_symlinks()

    note "Installing Vundle..."
    git clone git://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

#    note "rsync-ing remaining dotfiles..."
#    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" -av . ~

    note "Installing plugins using Vundle..."
    vim +'set nospell' +BundleInstall! +BundleClean! +qall!

    note "dotfile setup complete!"
}

cd "$(dirname "$0")"
#git pull

if [ "$1" == "--force" -o "$1" == "-f"]; then
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
source ~/.bash_profile
