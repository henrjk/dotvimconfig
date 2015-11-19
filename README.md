dotvimconfig
============

My personal vim configuration. Based on various places found on the web and github.

Prerequisites beyond vim and git are:

1. Delete or move ~/.vimrc and ~/.vim to backup locations.

2. The following has to be installed first:

  - node, npm
  - jshint ?

See file `versions.txt`

Get the vim configuration by:

```bash
cd ~
git clone http://github.com/henrjk/dotvimconfig.git
cd dotvimconfig
./setup-vimconfig.sh
```

### Updating

The bundles are included in this repository as copy without git knowing
about this.
This is done by:
1. Cloning the bundles (using `bin/dl-bundles.sh`)
2. Removing the .git directory in each bundle.
   This is done with `bin/include_bundles.sh`
3. The content is now committed and then pushed to github.

The script `bin/include_bundles.sh` captures recent version history for
each bundle before deleting the `.git` repository directory.

One can also update a single bundle by:
1. deleting the bundle.
2. cloning the bundle.
3. use script `bin/include_cwd_bundle.sh" to remove the .git directory and
   capture the version when ready to commit the version.
