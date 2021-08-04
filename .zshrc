#export LC_ALL=en_US.UTF-8
#export LANG=en_US.UTF-8

export VSCODE_HOME="/Applications/Visual Studio Code.app/Contents/Resources/app"

export GOPATH=$HOME/Developer/env/go

export JAVA_HOME=$HOME/Developer/env/jdk11/Contents/Home

export MAVEN_HOME=$HOME/Developer/env/apache-maven-3.8.1

export NODEJS_HOME=$HOME/Developer/env/node

#export NEOVIM_HOME=$HOME/Developer/env/nvim-osx64

#export VIM_HOME=/usr/local/Cellar/vim/8.2.3075

#export PYTHON=/usr/local/bin/python3

path=(
    $VSCODE_HOME/bin
    $GOPATH/bin
    $JAVA_HOME/bin
    $MAVEN_HOME/bin
    $NODEJS_HOME/bin
    $PATH
  )
export PATH=":$PATH"

# alias python=$PYTHON
alias vim=nvim

#PS1="%B%F{203}%n@%m %1~ %#%f%b "
#PS1="%B%F{203}%n@%d %1~ %#%f%b "
PS1="%B%F{104}%d %1~ %#%f%b "

fpath=(~/.zsh/completion $fpath)
autoload -U compinit
compinit -u

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

