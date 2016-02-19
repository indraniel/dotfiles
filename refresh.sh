#!/bin/bash

# note our base directory location
DOTFILE_DIR=$( cd `dirname $0` >/dev/null; pwd -P )
OS=$(uname)

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
    if [ "$OS" == "Darwin" ]; then
        /Applications/mvim -v +'set nospell' +BundleInstall! +BundleClean! +mapclear +qa!
    else
        vim +'set nospell' +BundleInstall! +BundleClean! +mapclear +qa!
    fi
}

function reset_YCM() {
    cd $DOTFILE_DIR/vim/bundle/YouCompleteMe

    if [ "$OS" == "Darwin" ]; then
        # need to use exact python that vim was compiled against
        perl -p -i -e 's|^\s*PYTHON_BINARY=python\d?$|PYTHON_BINARY=/System/Library/Frameworks/Python.framework/Versions/2.7/bin/python|;' install.sh
        ./install.sh --clang-completer

    elif [ "$OS" == "Linux" ]; then
        tmpdir=/tmp/ycm_build
        mkdir ${tmpdir} && cd ${tmpdir}

        llvm_root=${HOME}/software/clang-and-llvm-3.7.1/local
        libclang=${llvm_root}/lib/libclang.so
        python=${HOME}/.pyenv/versions/2.7.9

        cmake -G "Unix Makefiles" \
            -DPYTHON_LIBRARY=${python}/lib/libpython2.7.so \
            -DPYTHON_INCLUDE_DIR=${python}/include/python2.7/ \
            -DPYTHON_EXECUTABLE=${python}/bin/python \
            -DPATH_TO_LLVM_ROOT=${llvm_root} \
            . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp ;
        make ycm_support_libs VERBOSE=1 ;
        cd ${tmpdir}/ycm && \
            cmake \-E copy \
            ${libclang} ycm/CMakeFiles/ycm_core.dir/link.txtTARGET_FILE_DIR:ycm_core ;

        rm -rf ${tmpdir}
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
