#!/bin/bash

# This script rm -rf the bundle dir and then reclones it.
#
# To include bundles in git repo the .git repository content
# must be removed.
# Script include_bundles.sh is used for that.

# Initially copied from
# https://github.com/tsaleh/dotfiles/blob/d5fcdac3135758a649ad26f951917cd9b659189c/vim/update_bundles

# Requirements:
#   jshint: node and jshint command line tool

# cool things not yet added:
#  git://github.com/kana/vim-textobj-user.git  define ones own text objects
# bundles looking interesting but currently (perhaps) not needed.
perhaps_later=(
  git://github.com/Valloric/YouCompleteMe.git
  git://github.com/tsaleh/vim-tmux.git
  git://github.com/slim-template/vim-slim.git
  git://github.com/tpope/vim-rbenv.git
)


# git bundles for file handling
gb_files=(
  git://github.com/kien/ctrlp.vim.git
  git://github.com/scrooloose/nerdtree.git
)

# git bundles to support git
gb_git=(
  git://github.com/tpope/vim-fugitive.git
  git://github.com/tpope/vim-git.git
  git://github.com/gregsexton/gitv.git
  git://github.com/vim-scripts/Gist.vim.git
)

# General bundles to improve vim:
#   pasta makes pastes indent better.
gb_general=(
  git://github.com/godlygeek/csapprox.git
  git://github.com/sickill/vim-pasta.git
  git://github.com/tomtom/tcomment_vim.git
  git://github.com/tpope/vim-repeat.git
  git://github.com/tpope/vim-surround.git
  git://github.com/tpope/vim-unimpaired.git
  git://github.com/tpope/vim-vividchalk.git
  git://github.com/chrisbra/Recover.vim.git
  git://github.com/Lokaltog/vim-powerline.git
)

# language related bundles
gb_lang_web=(
  git://github.com/scrooloose/syntastic.git
  git://github.com/mattn/emmet-vim.git
  git://github.com/othree/html5.vim.git
  git://github.com/groenewege/vim-less.git
  git://github.com/hail2u/vim-css3-syntax.git
  git://github.com/pangloss/vim-javascript.git
  git://github.com/heavenshell/vim-jsdoc.git
  git://github.com/wookiehangover/jshint.vim.git
  git://github.com/elzr/vim-json.git
  git://github.com/vim-scripts/jQuery.git
)

gb_lang_go=(
  git://github.com/fatih/vim-go.git
)
gb_lang_etc=(
  git://github.com/tpope/vim-haml.git
  git://github.com/tpope/vim-markdown.git
)

git_bundles=( \
  "${gb_files[@]}" "${gb_git[@]}" "${gb_general[@]}" \
  "${gb_lang_web[@]}" "${gb_lang_go[@]}" "${gb_lang_etc[@]}" )


SCRIPT_DIR="${BASH_SOURCE%/*}"
CLONE_DIR="$SCRIPT_DIR/../downloads/bundle"

if [ -d "$CLONE_DIR" ]; then
  rm -rf "$CLONE_DIR" || eexit "rm -rf $CLONE_DIR failed."
fi

mkdir -p "$CLONE_DIR"
cd "$CLONE_DIR" || eexit "Failed to cd $CLONE_DIR."
pwd
for repo in "${git_bundles[@]}"; do
  git clone "$repo"
done

# some message output functions:
error () {
  local message="${1-}"
  if [ -z "$message" ]; then
    echo "" >&2
  else
    echo "ERROR: ${message}" >&2
  fi
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
