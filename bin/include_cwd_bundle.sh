#!/bin/bash
set -o nounset
# set -x

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

cd ".git" || eexit "The current directory \"$PWD\" must be a git repository"
cd ..

DIRNAME=${PWD##*/}
VERSION="$CLONE_DIR/version_$DIRNAME.txt"
echo "=== $DIRNAME history:" > $VERSION
# echo "=== $DIRNAME history captured on $(date -u +%Y-%m-%dT%T%z)" > $VERSION
# capturing the date leads to changes in git even if the version remain 
# the same. So probably better not to use the date here.
git log --format="%h %cI %d %s" -5 >> $VERSION
if [ $? -eq 0 ]; then
  cd ..
  rm -rf "$DIRNAME/.git"
else
  echo "=== $DIRNAME git log failed" >> $VERSION
fi
