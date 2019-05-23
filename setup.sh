#!/usr/bin/env bash

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
VIM="/.vimrc"
TMUX="/.tmux.conf"

echo "Making symlinks to .vimrc and .tmux.conf"
# ln -s $THISDIR$VIM ~/$VIM
# ln -s $THISDIR$TMUX ~/$TMUX

echo "Installing vim-plug"
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Installing Mac OS software"
    brew install ag
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    echo "Installing Linux software"
    sudo apt-get install silversearcher-ag -y
elif [[ "$OSTYPE" == "msys" ]]; then
    echo "Installing Windows software"
fi

echo "==> Now run :PlugInstall in vim!"
