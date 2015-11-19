#!/bin/bash
set -o nounset 
set -x

eexit () {  # name has same length as error making this easier to read.
  local message code
  message="$1"
  code="${2-2}"
  echo "ERROR: ${message}" >&2
  exit $code
}

REL_SCRIPT_DIR="${BASH_SOURCE%/*}"
SCRIPT_DIR="$( cd "$REL_SCRIPT_DIR" && pwd )"
CLONE_DIR="$SCRIPT_DIR/downloads/bundle"
VERSIONS="$CLONE_DIR/versions.txt"

touch "$VERSIONS"
pushd "$CLONE_DIR" || eexit "Failed to cd to \"$CLONE_DIR\""

echo "Versions captured on $(date -u +%Y-%m-%dT%T%z)" > "$VERSIONS"

for d in */.git ; do
  out=$( \
    cd "$d/.."    
    echo "=== ${PWD##*/} :" 
    git log --format="%h %cI %d %s" -5
  )
  if [ $? -eq 0 ]; then
    echo "$out" >> "$VERSIONS"
    rm -rf "$d" 
  else 
    echo "=== ${d}/.. failed" >> "$VERSIONS"
  fi 


done





