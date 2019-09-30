#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR=$SCRIPT_DIR/..

function enable
{
    mv ~/.$1 ~/.$1.bak
    ln -s $PROJECT_DIR/$1 ~/.$1
}

enable vim
enable vimrc
