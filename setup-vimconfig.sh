#!/bin/bash
# This script is in a git repository which contains my personal .vimrc file.
# It installs the pathogen bundle and after this vim should be started and
# one should verify using scriptnames: 
# that pathogen installed. 
#
ABS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# download files first, does nothing if already downloaded
$ABS_SCRIPT_DIR/download 
ln -s downloads/autoload autoload
ln -s downloads/bundle bundle

HOME_REL_SCRIPT_DIR=`python -c "import os.path; print os.path.relpath( '$ABS_SCRIPT_DIR', '$HOME')"`
DIR=$HOME_REL_SCRIPT_DIR
# Use much shorter DIR variable in remainder of script

if [[ -a $~/.vimrc ]]; then
	echo WARN: ~/.vimrc already exists: skipping creating symbolic linking to $DIR/.vimrc
else
	ln -s $DIR/.vimrc ~/.vimrc
fi

if [[ -a  ~/.vim ]]; then
	echo WARN: ~/.vim already exists: skipping creating symbolic linking to $DIR
else
	ln -s $DIR ~/.vim
fi

# https://github.com/tpope/vim-pathogen
if [[ -a  ~/.vim/autoload/pathogen.vim ]]; then
	echo WARN: ~/.vim/autoload/pathogen.vim already exists: skipping download.
else
	mkdir -p ~/.vim/autoload ~/.vim/bundle && \
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	# -L allow redirect, -Ss show error if it fails, -o output file
fi
if [[ ! -d  ~/.vim/bundle ]]; then
	mkdir -p ~/.vim/bundle
fi


