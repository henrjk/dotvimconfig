#!/bin/bash
set -o nounset
#set -x

cat << INFO
Removes .git directories in bundle repositories but captures
recent history before that in files downloads/bundle/version_<bundle>.txt.
INFO

eexit () {  # name has same length as error making this easier to read.
  local message code
  message="$1"
  code="${2-2}"
  echo "ERROR: ${message}" >&2
  exit $code
}

REL_SCRIPT_DIR="${BASH_SOURCE%/*}"
SCRIPT_DIR="$( cd "$REL_SCRIPT_DIR" && pwd )"
CLONE_DIR="$SCRIPT_DIR/../downloads/bundle"

pushd "$CLONE_DIR" || eexit "Failed to cd to \"$CLONE_DIR\""

for d in */.git ; do
  ( cd "$d/.." && "$SCRIPT_DIR/include_cwd_bundle.sh" )
done
