#!/usr/bin/env zsh

# setup pyenv
export PYENV_ROOT=$HOME/sw/pyenv
export PATH=$PYENV_ROOT/bin:$PATH
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
