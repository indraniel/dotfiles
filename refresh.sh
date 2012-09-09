#!/bin/bash

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

cd "$(dirname "$0")"

note "Refreshing vim plugins"
vim_refresh

unset refresh
unset warn
unset die
unset note
