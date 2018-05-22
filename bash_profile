export GOROOT=/usr/local/go
export GOPATH=/Users/maciej.lenc/go
export MYSQL_USERNAME='root'
export MYSQL_PASSWORD='admin'

export CC=/usr/local/bin/gcc-4.2
export CXX=/usr/local/bin/g++-4.2
export MACOSX_DEPLOYMENT_TARGET=10.9 # Resolves issues with nokogiri gem installation

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$GOROOT/bin:$PATH"
export PATH="$HOME/.rbenv/versions/2.1.5/lib/ruby/gems/2.1.0/bin:$PATH"
export PATH="/usr/local/Cellar/mysql56/5.6.31/bin:$PATH"

export DEFERRED_GARBAGE_COLLECTION=true
export EDITOR='vim'
export no_proxy=127.0.0.1 # Proxy fix for Rspec

eval "$(rbenv init -)"

source ~/dotfiles/git-completion.bash

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

#------------------------------------------------------
# CUSTOM COMMAND PROMPT
#------------------------------------------------------

# COLOUR VARIABLES ------------------------------------
FG_BLACK='\[\033[0;230m\]'
FG_RED='\[\033[0;31m\]'
FG_GREEN='\[\033[0;32m\]'
FG_YELLOW='\[\033[0;33m\]'
FG_BLUE='\[\033[0;34m\]'
FG_PURPLE='\[\033[0;35m\]'
FG_TEAL='\[\033[0;36m\]'
FG_WHITE='\[\033[0;37m\]'
FG_ORANGE='\[\033[0;214m\]'
NO_COLOUR='\[\033[0m\]'

PS1_TIME='\[\033[48;5;0m\033[38;5;250m\]'
PS1_PATH='\[\033[0;38;5;160m\]'
PS1_MARKER="$FG_ORANGE"
GIT_LABEL='\[\033[48;5;234m\033[38;5;26m\]'
GIT_JOIN='\[\033[48;5;179m\033[38;5;30m\]'
GIT_BRANCH='\[\033[48;5;245m\033[38;5;234m\]'
GIT_CLEAN='\[\033[48;5;22m\]'
GIT_DIRTY='\[\033[48;5;160m\]'
GIT_PATH='\[\033[48;5;0m\033[38;5;152m\]'
SVN_LABEL='\[\033[48;5;97m\033[38;5;17m\]'
SVN_PATH='\[\033[0;38;5;183m\]'
SVN_SPACER='\[\033[48;5;250m\]'

function check_user {
  # if user is not root
  if [[ $EUID -ne 0 ]]; then
    PS1_TIME="$NO_COLOUR\033[38;5;250m\] \$(date +%H:%M) "
    PS1_PATH="\[\033[0;38;5;222m\]"
    PS1_MARKER="$FG_WHITE\$$NO_COLOUR "
  else
    PS1_TIME="\[\033[48;5;160m\033[38;5;255m\] \$(date +%H:%M) \[\033[48;5;88m\033[38;5;17m\] \$(id -nu) "
    PS1_PATH="\[\033[0;38;5;165m\]"
    PS1_MARKER="$FG_RED#$NO_COLOUR "
  fi
}

# Output all available colour codes
# Used to create new colour variables
function colours {
  for i in {0..255}; do echo -e "\033[38;05;${i}m${i}"; done | column -c 80 -s '  '; echo -e "\e[m"
}

# Set the title of gnome terminal
function title {
  echo -ne "\033]0;$*\007"
}

# Return the name of the root directory for the current repo
function repo_root {
  d=`pwd`
  while [ "$d" != "" ]; do
    [ -d "$d"/.git ] && echo ${d##*/}
    d=${d%/*}
  done
}

# Check branch status
function get_branch_status {
  if [[ $(git status | tail -n1) == "nothing to commit (working directory clean)" ]]; then
    echo -e "$GIT_CLEAN"
  elif [[ $(git status | tail -n1) == "nothing to commit, working tree clean" ]]; then
    echo -e "$GIT_CLEAN"
  else
    echo -e "$GIT_DIRTY"
  fi
}

# Set the prompt according to which repo the current dir is in - if any
function set_prompt {
  # Set the default prompt
  PS1="$PS1_PATH\w$PS1_MARKER"

  # ADD GIT LABELS
  # If git status errors then we are not in a git repo
  # or we do not have git installed so leave prompt as default
  if [[ -z $(git status 2> /dev/null) ]]; then
    return
  fi

  # set repo name to the root dir name
  repo_name=$(repo_root)

  # find the origin file name of remote repo
  remote_repo_file=$(git remote -v | grep origin | tail -1 | cut -f2 -d":" | cut -f1 -d" ")

  # If there is a remote origin use file name to get repo name
  if [[ -n $remote_repo_file ]]; then
    repo_name=$(basename $remote_repo_file) | cut -f1 -d"."
  fi

  # set the title of the terminal to the current repo name
  term_title=(${repo_name//_/ })
  echo -ne "\033]0;${term_title[@]^}\007"

  # Check if the working branch is clean #253
  #branch_status=$([[ $(git status | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*")
  branch_status=$(get_branch_status)

  # Get the name of the current branch
  current_branch=$(git branch --no-color | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/")

  # Set prompt with GIT labels
  PS1="$GIT_LABEL ${repo_name} $GIT_BRANCH ${current_branch} ${branch_status} $NO_COLOUR $GIT_PATH\w$NO_COLOR $PS1_MARKER"
}

# Output chmod reference diagram and usage
function chmod_ref {
  echo "
        OWNER  GROUP   WORLD
        r w x  r w x   r w x
        1 1 1  1 0 1   1 0 1
          7      5       5
          |______|_______|
                 |
                755
  "

  echo "
 000  001  010  011  100  101  110  111
  0    1    2    3    4    5    6    7
  "

  chmod --help
}

# Chief function to call all / any custom functions
function prompt_command {
	check_user
  set_prompt
}

# Initialisation commands
PROMPT_COMMAND=prompt_command

export NVM_DIR="/Users/maciej.lenc/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# Added by install_latest_perl_osx.pl
[ -r /Users/maciej.lenc/.bashrc ] && source /Users/maciej.lenc/.bashrc

export PATH="/usr/local/opt/qt/bin:$PATH"
