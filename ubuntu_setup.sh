#!/usr/bin/env bash

# If any command fails, abort this script
set -e

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
VIM="/.vimrc"
TMUX="/.tmux.conf"

echo "Making symlinks to .vimrc and .tmux.conf"
ln -s $THISDIR$VIM ~/$VIM
ln -s $THISDIR$TMUX ~/$TMUX

echo "Installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing vim plugins"
vim +'PlugInstall --sync' +qa

# echo "Installing Fira Code nerd font"
# ~/.vim/plugplugplug/nerd-fonts/install.sh FiraCode

echo "Installing Linux software"
sudo apt-get install silversearcher-ag -y

# Need these for You Complete Me in vim
sudo apt install build-essential cmake3 python3-dev -y


sudo ~/.vim/plugplugplug/youcompleteme/install.py --all
