#!/usr/bin/env bash

# If any command fails, abort this script
set -e

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
VIM="/.vimrc"
BASH="/.bashrc"
TMUX="/.tmux.conf"

################################################################################
echo "Making symlinks to .vimrc, .tmux.conf and .bash_profile"
ln -s $THISDIR$VIM ~/$VIM
ln -s $THISDIR$TMUX ~/$TMUX
ln -s $THISDIR$BASH ~/$BASH
ln -s ~/.bashrc ~/.bash_profile

################################################################################
echo "Installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing vim plugins"
vim +'PlugInstall --sync' +qa

################################################################################
# echo "Installing Fira Code nerd font"
# ~/.vim/plugplugplug/nerd-fonts/install.sh FiraCode

################################################################################
echo "Installing brews 🍺"
if [ -e $cwd/swag/brews ]; then
	chapter "Installing Homebrew formulae…"

	for brew in $(<$cwd/swag/brews); do
		install_brews $brew
	done
fi

################################################################################
echo "Installing You Complete Me"
sudo ~/.vim/plugplugplug/youcompleteme/install.py --all

