#!/bin/bash
# This script is in a git repository which contains my personal .vimrc file.
# It installs the pathogen bundle and after this vim should be started and
# one should verify using scriptnames: 
# that pathogen installed. 
#
ABS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cat << INFO
Using vim configuration as version controlled.
Versions are shown in file downloads/bundle/versions.txt

To update all version use
  dev $ ./download.sh

This will clone all plugins and redownload pathogen.vim.
To share this the .git repository information must be deleted with
  dev $ ./include_bundles.sh

INFO

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

[[ -a autoload ]] || ln -s downloads/autoload autoload || eexit "ln -s for autoload failed"
[[ -a bundle   ]] || ln -s downloads/bundle bundle || eexit "ln -s for bundle failed"


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




