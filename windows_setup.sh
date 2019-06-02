#!/usr/bin/env bash

# If any command fails, abort this script
set -e

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
VIM="/.vimrc"
TMUX="/.tmux.conf"

echo "Making symlinks to .vimrc"
ln -s $THISDIR$VIM ~/$VIM

echo "Installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing vim plugins"
vim +'PlugInstall --sync' +qa

echo "Installing Fira Code nerd font"
~/.vim/plugplugplug/nerd-fonts/install.sh FiraCode

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Installing Mac OS software"
    brew install ag

    # Need these for You Complete Me in vim
    brew install cmake macvim

    echo "Making symlinks to .tmux.conf and .bash_profile"
    ln -s $THISDIR$TMUX ~/$TMUX
    ln -s ~/.bashrc ~/.bash_profile
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    echo "Installing Linux software"
    sudo apt-get install silversearcher-ag -y

    # Need these for You Complete Me in vim
    sudo apt install build-essential cmake3 python3-dev -y

    echo "Making symlinks to .tmux.conf"
    ln -s $THISDIR$TMUX ~/$TMUX
elif [[ "$OSTYPE" == "msys" ]]; then
    echo "Installing Windows software"
fi

sudo ~/.vim/plugplugplug/youcompleteme/install.py --all
