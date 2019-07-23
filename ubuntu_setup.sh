#!/usr/bin/env bash

# If any command fails, abort this script
set -e
set -u
set -o pipefail

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
VIM="/.vimrc"
TMUX="/.tmux.conf"
BASH="/.bashrc"

sudo apt-get install vim tmux git -y

echo "Installing z"
git clone https://github.com/rupa/z.git
echo ". $THISDIR/z/z.sh" >> $THISDIR$BASH

echo "Configuring git"
git config --global alias.ac '!git add && git commit'
git config --global alias.co checkout

echo "Making symlinks to .vimrc and .tmux.conf"
ln -s $THISDIR$VIM ~/$VIM
ln -s $THISDIR$TMUX ~/$TMUX

echo "Installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing vim plugins"
vim +'PlugInstall --sync' +qa

echo "Installing Linux software"
sudo apt-get install silversearcher-ag -y

echo "Installing dependencies for You Complete Me"
sudo apt install build-essential cmake3 python3-dev -y
sudo ~/.vim/plugplugplug/youcompleteme/install.py --all
