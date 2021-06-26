#export LC_ALL=en_US.UTF-8
#export LANG=en_US.UTF-8

export VSCODE_HOME="/Applications/Visual Studio Code.app/Contents/Resources/app"

export GOPATH=$HOME/Documents/env/go

export JAVA_HOME=$HOME/Documents/env/jdk-11.0.11+9/Contents/Home

export MAVEN_HOME=$HOME/Documents/env/apache-maven-3.8.1

path=(
    $VSCODE_HOME/bin
    $GOPATH/bin
    $JAVA_HOME/bin
    $MAVEN_HOME/bin
    $PATH
  )
export PATH=":$PATH"

#PS1="%B%F{203}%n@%m %1~ %#%f%b "
#PS1="%B%F{203}%n@%d %1~ %#%f%b "
PS1="%B%F{green}%d %1~ %#%f%b "

fpath=(~/.zsh/completion $fpath)
autoload -U compinit
compinit -u
