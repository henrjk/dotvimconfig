dotvimconfig
============

My personal vim configuration. Based on various places found on the web and github.

Prerequisites beyond vim and git are:

1. Delete or move ~/.vimrc and ~/.vim to backup locations.

2. The following has to be installed first:

  - node, npm
  - jshint ?

See file `versions.txt`

First steps are:
```bash
cd ~
git clone http://github.com/henrjk/dotvimconfig.git
cd dotvimconfig
./setup-vimconfig.sh
```

download curls and git clones stuff (via clone_bundles)
This took only a minute or so for me.

Start vim and check using `:scriptnames` that pathogen appears to have been
installed.
Then exit vim and run the script to install this configurations list of vim
plugins. These will all be cloned from github using their latest version.
This likely *will break in the future* when they introduce changes
which are no longer compatible with the installed version of vim and possible other tools in the environment.

### Updating 

You can update manually by getting new contents fom git like so:

cd bundle/vim-go
git pull 

To update all bundles.€ý,€ý,

