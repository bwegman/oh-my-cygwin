#!/bin/bash

# install apt-cyg
lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg > apt-cyg
install apt-cyg /bin

# install some stuff like vim and git
apt-cyg install zsh mintty vim curl git openssh git-completion git-gui gitk

#setting up vim
cp /usr/share/vim/vim74/vimrc_example.vim ~/.vimrc

# Create initial /etc/zshenv
[[ ! -e /etc/zshenv ]] && echo export PATH=/usr/bin:\$PATH > /etc/zshenv

# install OH MY ZSH
/usr/bin/env git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]
then
  cp ~/.zshrc ~/.zshrc.orig;
  rm ~/.zshrc;
fi
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

# setting up zsh as default
sed -i "s/$USER\:\/bin\/bash/$USER\:\/bin\/zsh/g" /etc/passwd

# change some security stuff
compaudit | xargs chown -R :Users
compaudit | xargs chmod ga-w
rm ~/.zcompdump*

# et voila just start it
/usr/bin/env zsh



