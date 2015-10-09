# copy/paste on terminal with xclip
alias xcopy='xclip -selection c'
alias xpaste='xclip -selection clipboard -o'

# development tasks
alias be='bundle exec'
alias rs='be rspec'
alias ror='be rails s'
alias dj="be rake jobs:clear jobs:work"

# Directory Nav
alias ..="cd .."
alias ll='ls -alF --color=auto'
alias la='ls -A'
alias l='ls -CF'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# search functions
alias findfile='find . -iname'
alias inspect='du -csh'
alias fsearch='git ls-files | grep'
