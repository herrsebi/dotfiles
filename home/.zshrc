# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#alias qt1=curl -XPOST http://ant-tracking1.n.collins.kg:9200/tracking/_search -d 
#alias qfp1=curl -XPOST http://ant-tracking1.n.collins.kg:9200/fp_to_userid/_search -d


# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git sublime vagrant osx task safe-paste symfony2 vi-mode git-flow web-search)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

alias -g gs='git st'
alias -g G='| grep'
alias -g L='| less'
alias -g RMQ=' -L 15672:localhost:15672'

export HOMEBREW_GITHUB_API_TOKEN='6c43dd0dd2af25a46bcb973e5fb97f087b274ec3'

export GOPATH=/Users/spleschko/Documents/work/go
#

## Hadoop Shizzle
export HADOOP_HOME="/Users/spleschko/hadoop-2.3.0"
export SPARK_HOME="/Users/spleschko/spark-1.1.0"
export YARN_CONF_DIR="/Users/spleschko/Documents/work/yarn-conf"
export HADOOP_CONF_DIR="/Users/spleschko/Documents/work/hadoop-conf"

### Added heroku, rvm and gotools
export PATH="$HADOOP_HOME/bin:$SPARK_HOME/bin:/usr/local/heroku/bin:$PATH:$HOME/.rvm/bin:$GOPATH/bin"


