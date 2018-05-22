# development tasks
alias gotst="go test -coverprofile=coverage.out"
alias gocov="go tool cover -func=coverage.out"
alias gohml="go tool cover -html=coverage.out"
alias s3size="function _s3size(){ aws s3 ls --summarize --human-readable --recursive s3://$1; };_s3size"

# Directory Nav
alias ..="cd .."
alias ll='ls -alF'
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
alias ff='find . -iname'
alias inspect='du -csh'
alias fsearch='git ls-files | grep'
