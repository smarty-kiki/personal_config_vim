#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR=$SCRIPT_DIR/..

REMOTE_CONFIG=$PROJECT_DIR/vimrc_remote

cat $PROJECT_DIR/vim/subconfig/vimset > $REMOTE_CONFIG
echo >> $REMOTE_CONFIG
cat $PROJECT_DIR/vim/subconfig/vimfunction >> $REMOTE_CONFIG
echo >> $REMOTE_CONFIG
cat $PROJECT_DIR/vim/subconfig/vimmap >> $REMOTE_CONFIG
