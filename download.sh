#!/bin/bash

# Download all files needed so that subsequent
# setup does not require network access

ABS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DOWNLOADS="$ABS_SCRIPT_DIR/downloads"

mkdir -p "$DOWNLOADS"

# https://github.com/tpope/vim-pathogen
if [[ -a  "$DOWNLOADS/autoload/pathogen.vim" ]]; then
  warn "$DOWNLOADS/autoload/pathogen.vim already exists: skipping download."
else
  mkdir -p "$DOWNLOADS/autoload" && \
  curl -LSso "$DOWNLOADS/autoload/pathogen.vim" https://tpo.pe/pathogen.vim || \
  eexit "curl pathogen failed"
  # -L allow redirect, -Ss show error if it fails, -o output file
fi

if [[ -d  "$DOWNLOADS/bundle" ]]; then
  warn "$DOWNLOADS/bundle already exists: skipping cloning of bundles."
else
  "$ABS_SCRIPT_DIR/clone_bundles.sh" || eexit "clone_bundles.sh failed" 
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





