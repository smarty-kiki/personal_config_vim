#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR=$SCRIPT_DIR/..

function disable
{
    rm ~/.$1
    mv ~/.$1.bak ~/.$1
}

disable vim
disable vimrc
