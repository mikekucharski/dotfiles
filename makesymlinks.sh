#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                      # dotfiles directory
backupdir=~/dotfiles_old               # old dotfiles backup directory
files="bashrc vimrc vim Xresources" # list of files/folders to symlink in homedir
declare -A filemanager
filemanager[vim]=~/vim
filemanager[vimrc]=~/.vimrc
filemanager[bashrc]=~/.bashrc
filemanager[Preferences.sublime-settings]=~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $backupdir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
	if [ -f ~/.$file ]; then
		echo "Found $file"
	fi
	# echo "Moving any existing dotfiles from ~ to $olddir"
	# mv ~/.$file ~/dotfiles_old/
	# echo "Creating symlink to $file in home directory."
	# ln -s $dir/$file ~/.$file
done

for dotfile in ${!filemanager[@]}; do
	loc=${filemanager[${dotfile}]}
	echo $dotfile $loc
done