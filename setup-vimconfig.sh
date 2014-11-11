#!/bin/bash
# This script is in a git repository which contains my personal .vimrc file as well 
# as pathogen installed. 
# required installs curl:
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
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


