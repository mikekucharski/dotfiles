#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles            # dotfiles dir
backupdir=~/dotfiles_old  # backup dir
declare -A filemanager    # associative array
filemanager[vim]=~/.vim
filemanager[vimrc]=~/.vimrc
filemanager[bashrc]=~/.bashrc
filemanager[Preferences.sublime-settings]=~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings

##########

# create dotfiles_old in homedir
echo -n "mkdir \"$backupdir\" ..."
mkdir -p $backupdir
echo "done"

# change to the dotfiles directory
echo -n "cd \"$dir\" ..."
cd $dir
echo "done"

for dotfile in ${!filemanager[@]}; do
	loc=${filemanager[${dotfile}]}   # index into assoc array
	if [ -f $loc ] || [ -d $loc ]; then
		echo "[BACKUP] Backing up \"$loc\" to \"$backupdir\""
		mv $loc $backupdir
	fi

	echo "[SYM] Creating symlink from \"$dir/$dotfile\" to \"$loc\""
	ln -s $dir/$dotfile $loc
done