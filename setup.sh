#!/bin/bash

if [ $# -ne 1 ];then
	echo "usage: $0 (mac|linux)"
	exit 1
fi

cp .vimrc ~
cp .bash_dev ~
cp .tmux.conf ~
cp -r bin ~

if [ $1 == "mac" ];then
	chsh -s /bin/bash
	brew install coreutils

	cp .bashrc ~
	cp .bash_profile ~

	source ~/.bash_profile
else
	echo "if [ -f ~/.bash_dev ]; then" >> ~/.bashrc
	echo "	. ~/.bash_dev" >> ~/.bashrc
	echo "fi" >> ~/.bashrc
fi

echo "Run belows"
echo "  1. . ~/.bashrc"
echo "  2. For VI Plugin, run -> init_env"
echo "  3. vi -> press F7"
