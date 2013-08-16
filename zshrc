# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="crooney"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Change this value to set how frequently ZSH updates¬
export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/share/cabal/bin:$HOME/go:$HOME/go/bin/:$HOME/goproj/bin:$HOME/.cabal/bin:$HOME/bin

source $HOME/.zaliases

export CDPATH=$CDPATH:$HOME/proj:$HOME/goproj

setopt interactivecomments
setopt auto_cd

REPORTTIME=10

setopt extendedglob
setopt caseglob

cl=`which clang`
if [ -x $cl ] ; then
    export CC=clang
    export CXX=clang++
fi

vp=`which vimpager`
if [ -x $vp ] ; then
    export PAGER=vimpager
    alias less=$PAGER
    alias zless=$PAGER
fi

alias lein="noglob lein"

alias tmux="tmux -2"
