#!/bin/bash

# Download all files needed to refresh content.
#
# To share content use include_bundles.sh

ABS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DOWNLOADS="$ABS_SCRIPT_DIR/downloads"

mkdir -p "$DOWNLOADS"

# https://github.com/tpope/vim-pathogen
mkdir -p "$DOWNLOADS/autoload" && \
curl -LSso "$DOWNLOADS/autoload/pathogen.vim" https://tpo.pe/pathogen.vim || \
eexit "curl pathogen failed"
# -L allow redirect, -Ss show error if it fails, -o output file

"$ABS_SCRIPT_DIR/clone_bundles.sh" || eexit "clone_bundles.sh failed" 

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





