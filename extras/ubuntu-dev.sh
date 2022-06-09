#!/bin/bash

if [ "$EUID" -eq 0 ]
	then echo "Please dont run as root"
	exit
fi

# add neovim 0.5-dev ppa
sudo apt-add-repository -y ppa:neovim-ppa/unstable

# install build-essential git gcc
sudo apt update
sudo apt install -y build-essential libncurses-dev bison flex libssl-dev libelf-dev ssh git vim net-tools zstd neovim python3-pip exuberant-ctags clangd ripgrep curl

mkdir ~/.config/nvim
mkdir /work/
sudo chown -R $USER:$USER /work

cp ../bashrc ~/.bashrc
cp ../gitconfig ~/.gitconfig
cp ../vimrc ~/.vimrc
cp ../init.vim ~/.config/nvim/init.vim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
