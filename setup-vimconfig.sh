#!/bin/bash
# This script is in a git repository which contains my personal .vimrc file.
# It installs the pathogen bundle and after this vim should be started and
# one should verify using scriptnames: 
# that pathogen installed. 
#
ABS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# download files first, does not download again if already downloaded
$ABS_SCRIPT_DIR/download.sh   # also establishes symbolic links

HOME_REL_SCRIPT_DIR=`python -c "import os.path; print os.path.relpath( '$ABS_SCRIPT_DIR', '$HOME')"`
DIR="$HOME_REL_SCRIPT_DIR"
# Use much shorter DIR variable in remainder of script

if [[ -a $~/.vimrc ]]; then
  warn "~/.vimrc already exists: skipping creating symbolic linking to $DIR/.vimrc"
else
  ln -s "$DIR/.vimrc" ~/.vimrc
fi

if [[ -a  ~/.vim ]]; then
  warn "~/.vim already exists: skipping creating symbolic linking to $DIR"
else
  ln -s "$DIR" ~/.vim
fi

# https://github.com/tpope/vim-pathogen
if [[ -a  ~/.vim/autoload/pathogen.vim ]]; then
  warn "~/.vim/autoload/pathogen.vim already exists: skipping download."
else
  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
  # -L allow redirect, -Ss show error if it fails, -o output file
fi
if [[ ! -d  ~/.vim/bundle ]]; then
  mkdir -p ~/.vim/bundle
fi

# some message output functions:
error () {
  local message="${1-}"
  if [ -z "$message" ]; then
    echo "" >&2
  else
    echo "ERROR: ${message}" >&2
  fi
}

warn() {
  local message
  message="$1"
  echo "WARN: ${message}" >&2
}

note () {
  local message
  message="$1"
  echo "NOTE: ${message}" >&2
}

eexit () {  # name has same length as error making this easier to read.
  local message code
  message="$1"
  code="${2-2}"
  echo "ERROR: ${message}" >&2
  exit $code
}




