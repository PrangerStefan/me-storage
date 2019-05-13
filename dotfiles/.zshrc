# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

[[ -s /home/stefan/.autojump/etc/profile.d/autojump.sh ]] && source /home/stefan/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u


# Path to your oh-my-zsh installation.
  export ZSH=/home/stefan/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.


plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
export PROMPT='[%(?:%{[01;32m%}:%{[01;31m%})%n@%s%{[36m%}%c%{[00m%}] '
source ~/.config/.git-zsh
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


export SUMO_HOME="/usr/share/sumo"
export PATH=$PATH":$HOME/bin"

alias op="xdg-open $1"
alias .clear="clear"
alias download="youtube-dl -i --extract-audio --audio-format mp3 --audio-quality 0 $1"
alias whereami="pwd"
alias whatdoes="declare -f $1"
alias prettyjson='python -m json.tool'
alias todo="subl ~/me ~/me/todo.org"
alias ret="echo $?"
alias sd="du -aH | grep $1"
alias l="ls -altr --color=always"
alias :q="exit"
alias im="sxiv"

if [ -f ~/.zsh/hcialias ]; then
    source ~/.zsh/hcialias
else
    print "404: ~/.zsh/hcialias not found."
fi

xprism () {
	/home/stefan/Downloads/prism-games-2.0.beta3-linux64/bin/xprism
}
comp () {
	(cd ~/Documents/projects/Tourplaner/route; make all;)
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

source ~/.rvm/scripts/rvm

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/.ruby-scripts
source ~/.bash-functions
source ~/.sumo-functions
source ~/.custom-commands
source ~/me/scripts/fs-scripts

export GREP_COLOR="1;37;42"

# added by Miniconda3 installer
export PATH="/home/stefan/miniconda3/bin:$PATH"


export GUROBI_HOME="/home/stefan/Downloads/gurobi801/linux64"
export PATH="${PATH}:${GUROBI_HOME}/bin"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib"
export GRB_LICENSE_FILE="$HOME/gurobi.lic"

query() {java -jar client/target/client-1.0-SNAPSHOT-jar-with-dependencies.jar ./application $@}
jsoncurl() {
    curl "$1" | python -m json.tool | pygmentize -l json
}
jsoncat () {
	cat "$1" | python -m json.tool | pygmentize -l json
}

pi() {
	ssh pi@192.169.0.199
}

GUI () {

	/usr/lib/jvm/jdk-11/bin/java -Djava.library.path=/home/stefan/Documents/javafx-sdk-11.0.1/lib --module-path /home/stefan/Documents/javafx-sdk-11.0.1/lib --add-modules=javafx.controls,javafx.fxml -javaagent:/home/stefan/Downloads/idea-IU-182.4505.22/lib/idea_rt.jar=33541:/home/stefan/Downloads/idea-IU-182.4505.22/bin -Dfile.encoding=UTF-8 -classpath /home/stefan/Documents/Studium/SVU/client-server/client/target/classes:/home/stefan/Documents/javafx-sdk-11.0.1/lib/src.zip:/home/stefan/Documents/javafx-sdk-11.0.1/lib/javafx-swt.jar:/home/stefan/Documents/javafx-sdk-11.0.1/lib/javafx.web.jar:/home/stefan/Documents/javafx-sdk-11.0.1/lib/javafx.base.jar:/home/stefan/Documents/javafx-sdk-11.0.1/lib/javafx.fxml.jar:/home/stefan/Documents/javafx-sdk-11.0.1/lib/javafx.media.jar:/home/stefan/Documents/javafx-sdk-11.0.1/lib/javafx.swing.jar:/home/stefan/Documents/javafx-sdk-11.0.1/lib/javafx.controls.jar:/home/stefan/Documents/javafx-sdk-11.0.1/lib/javafx.graphics.jar:/home/stefan/Documents/Studium/SVU/client-server/shared/target/classes:/home/stefan/.m2/repository/com/google/code/gson/gson/2.8.5/gson-2.8.5.jar:/home/stefan/.m2/repository/commons-cli/commons-cli/1.4/commons-cli-1.4.jar:/home/stefan/Documents/Studium/SVU/client-server/client/dependencies/jfxrt.jar at.tugraz.svu.ClientMain ./application -g
}

export PATH=$HOME/local/bin:$PATH
export JAVA_HOME=/usr/lib/jvm/jdk-11

syncdotfiles >> /dev/null

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS="--reverse --ansi"
export PATH="${PATH}:/home/stefan/.fzf/bin/fzf"
