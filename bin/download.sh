#!/bin/bash

# Download all files needed to refresh content.
#
# To share content use include_bundles.sh

ABS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


"$ABS_SCRIPT_DIR/dl-pathogen.sh" ||
  eexit "Failed to download pathogen"

"$ABS_SCRIPT_DIR/dl-bundles.sh" ||
  eexit "Failed to download (clone) bundles"

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
