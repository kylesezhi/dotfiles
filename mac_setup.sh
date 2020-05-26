#!/usr/bin/env bash

# If any command fails, abort this script
set -e

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
VIM="/.vimrc"
BASH="/.bashrc"
TMUX="/.tmux.conf"

################################################################################
echo "Making symlink to .vimrc, .tmux.conf and .bash_profile"
if [ ! -f $THISDIR$VIM ]; then
	ln -s $THISDIR$VIM ~/$VIM
fi

if [ ! -f $THISDIR$VIM ]; then
	ln -s $THISDIR$TMUX ~/$TMUX
fi

if [ ! -f $THISDIR$VIM ]; then
	ln -s $THISDIR$BASH ~/$BASH
fi

if [ ! -f $THISDIR$VIM ]; then
	ln -s ~/.bashrc ~/.bash_profile
fi

################################################################################
# echo "Installing xcode CLI"
# xcode-select —-install

################################################################################
if test ! $(which brew); then
	echo "Installing homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

################################################################################
echo "Updating homebrew formulae"
brew update

################################################################################
CASKS=(
	alfred
  calibre
	expressvpn
	firefox
	google-chrome
	iina
	iterm2
  microsoft-office
  omnidisksweeper
	slack
	spotify
	visual-studio-code
	evernote
	xquartz
)
echo "Installing cask apps"
brew cask install ${CASKS[@]}

################################################################################
echo "Installing homebrew packages"
PACKAGES=(
	exercism
	git
	htop
	macvim
	mps-youtube
	tldr
	tmux
	wget
	yarn
)
echo "Installing packages..."
brew install ${PACKAGES[@]}

