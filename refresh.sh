#!/bin/bash

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

function vim_refresh() {
    vim +'set nospell' +BundleInstall! +BundleClean! +mapclear +qa!
}

function reset_YCM() {
    cd $DOTFILE_DIR/vim/bundle/YouCompleteMe

    os=$(uname)
    if [ "$os" == "Darwin" ]; then
        # need to use exact python that vim was compiled against
        perl -p -i -e 's|^\s*PYTHON_BINARY=python\d?$|PYTHON_BINARY=/System/Library/Frameworks/Python.framework/Versions/2.7/bin/python|;' install.sh
        ./install.sh --clang-completer
    elif [ "$os" == "Linux" ]; then
        echo "Please custom-compile the vim YouCompleteMe plugin (if necessary)!"
    fi

}

cd "$(dirname "$0")"

note "Refreshing vim plugins"
vim_refresh
note "Resetting YouCompleteMe (YCM) vim plugin"
reset_YCM

unset refresh
unset warn
unset die
unset note
