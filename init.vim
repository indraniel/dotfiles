" for neovim: should be inside: ~/.config/nvim/init.vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
let homedir = $HOME
let g:python_host_prog = homedir . '/' . '.pyenv/versions/2.7.13/bin/python'
source ~/.vimrc
