#export LC_ALL=en_US.UTF-8
#export LANG=en_US.UTF-8

export VSCODE_HOME="/Applications/Visual Studio Code.app/Contents/Resources/app"

export GOPATH=$HOME/Documents/env/go

export JAVA_HOME=$HOME/Documents/env/jdk-11.0.11+9/Contents/Home

export MAVEN_HOME=$HOME/Documents/env/apache-maven-3.8.1

export NODEJS_HOME=$HOME/Documents/env/nodejs/node-v14.17.2

export NEOVIM_HOME=$HOME/Documents/env/nvim-osx64

export VIM_HOME=/usr/local/Cellar/vim/8.2.3075

export PYTHON=/usr/local/bin/python3

path=(
    $VSCODE_HOME/bin
    $GOPATH/bin
    $JAVA_HOME/bin
    $MAVEN_HOME/bin
    $NODEJS_HOME/bin
    $NEOVIM_HOME/bin
    $VIM_HOME/bin
    $PYTHON
    $PATH
  )
export PATH=":$PATH"

alias python=$PYTHON

#PS1="%B%F{203}%n@%m %1~ %#%f%b "
#PS1="%B%F{203}%n@%d %1~ %#%f%b "
PS1="%B%F{104}%d %1~ %#%f%b "

fpath=(~/.zsh/completion $fpath)
autoload -U compinit
compinit -u
