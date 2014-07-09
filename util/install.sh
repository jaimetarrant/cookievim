#!/bin/bash

# Simple installer for CookieVim

echo ""
echo "   =^..^=  Cookie Vim!  "
echo ""
echo "CookieVim installer ... "
echo ""
echo "INFORMATION: This installer will backup your existing"
echo ".vimrc and .vim directory if they exist, however nothing else."
echo "All cookievim configurations are made in the ~/.cookievim-config"
echo "directory, if it exists it will be left alone."
echo ""
echo "If you are re-installing over an existing cookievim setup, your"
echo ".cookievim-config directory will not be touched. If you want to"
echo "create a new one, move and backup or delete your existing one "
echo "first. "
echo ""
read -t 60 -p "Hit ENTER to contiune or <Ctrl>-C to exit. Resuming in 60s"


# Setup backup file names.

VIMRC_BACKUP_DATE=`date +%Y%m%d-%s`
VIMRC_BACKUP_FILE="vimrc-backup-$VIMRC_BACKUP_DATE.txt"
VIM_BACKUP_DIR="vimdir-backup-$VIMRC_BACKUP_DATE"

# Pre-installation checks.

echo ""
echo "Running pre-installation tests and backups ..."

# Lets go home

cd ~

# Check that git is available

if ! type git > /dev/null; then
  echo " git not found! "
  echo " you will need to install git before continuing..."
  exit 0;
else
  echo " found git ... good"
fi

# Check for and backup .vimrc and .vim if necessary.

if [[ -e ~/.vimrc ]]; then
  echo " backing up existing .vimrc"
  mv ~/.vimrc ~/$VIMRC_BACKUP_FILE
else
  echo " we will create a .vimrc for you."
fi

if [[ -e ~/.vim ]]; then
  echo " backing up existing .vim directory"
  mv ~/.vim ~/$VIM_BACKUP_DIR
else
  echo " we will create a .vim directory for you."
fi

if [[ ! -e ~/.tmp ]]; then
  echo " making .tmp directory for vim edit backup files."
  mkdir .tmp
else
  echo " .tmp directory found, moving along."
fi

# Start Install

echo "Installing CookieVim"

echo " creating the .vim directory ..."
mkdir .vim

echo " creating the .vim/bundle directory ..."
mkdir .vim/bundle

echo " cloning cookievim"
git clone git@github.com:jaimetarrant/cookievim.git ~/.vim/cookievim

echo " cloning gmarik/vundle ..."
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo " linking .vimrc to ~/.vim/vimrc, which loads cookievim ..."
ln -s ~/.vim/cookievim/vimrc ~/.vimrc

# Create a configuration directory.
# Clone my config if desired.
if [[ -e ~/.cookievim-config ]]; then
  echo " found a cookievim-config directory, we will leave it be .."
else

  while [ "$yn" != "y" ]; do
    echo ""
    echo " Select default starting configuration."
    echo ""
    echo " 1) Empty Configuration Directory - One example plugin configuration file,"
    echo "    also an empty general user configuration file."
    echo ""
    echo " 2) Jaime's settings & plugins <-- recommended, you can customise/change later"
    echo "    It's probably easier to get started this way, and it is pretty light anyway."
    echo ""

    read USER_SELECTION;

    case $USER_SELECTION in

      1) echo " creating an empty config dir. Are you sure? (y/n)"
        read yn
        echo " creating empty directory tree"
        mkdir ~/.cookievim-config
        cp -r ~/.vim/cookievim/util/skel/* ~/.cookievim-config/
        mv ~/.cookievim-config/personal/user-settings.file ~/.cookievim-config/personal/$USER.vim
        echo " done.";;

      2) echo " creating a copy of Jaime\'s vim settings and plugins (y/n)"
        read yn
        echo " cloning cookievim-config"
        git clone git@github.com:jaimetarrant/cookievim-config.git ~/.cookievim-config
        echo " done.";;
    esac
  done
fi

# Last steps

echo " nearly finished ..."
echo ""
echo " =^..^=  Cookie Vim is installed! Have fun, I hope you like it ... "
echo ""
echo "We will now start vim and install configured bundles ..."
echo "Any errors that pop up should go away after the plugins are installed."
echo ""
echo "If you add or remove bundles, dont forget to run :BundleInstall or "
echo ":BundleUpdate to update the configuration."
echo ""
echo "Remember, all your config stuff lives in the ~/.cookievim-config "
echo "directory. You do need to touch ~/.vim/ or your ~/.vimrc file with"
echo "this setup. The reason is to allow cookievim core updates without "
echo "overwriting your configuration settings."
echo ""
echo "I hope you find this approach useful. It's an attempt at a simple and"
echo "easy to follow config that can still take advantage of the many"
echo "powerful plugins people have created and shared."
echo ""
echo "Final step. Load vim and install plugins... "
echo ""

read -t 60 -p "Hit ENTER to contiune, we'll automatically start in 60 seconds"
echo ""

# Run Bundle Install to complete setup

vim +BundleInstall

# Done.
