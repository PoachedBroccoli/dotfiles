#! /usr/bin/env bash

RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
NORMAL="$(tput sgr0)"

exectime=$(date "+%Y-%m-%d_%H-%M-%S")

BackupOldDotfiles() {
    dotfiles="
    .vimrc
    .ideavimrc
    "
    for c in ${dotfiles}; do
        echo -e "start backup ${c}: \c"
        [ -f $HOME/${c} ] && mv $HOME/${c}{,.${exectime}.bak}
        echo "${GREEN}backup ${c} done${NORMAL}"
    done
}

BackupOldDotfiles

# 不使用软连接

# .vimrc
cp ../vim/vimrc  ${HOME}/.vimrc

# colors
mkdir -p ${HOME}/.vim/colors
cp ../vim/colors/heshui.vim  ${HOME}/.vim/colors

# .ideavimrc
cp ../idea/ideavimrc  ${HOME}/.ideavimrc
