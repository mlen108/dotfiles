function prompt_char {
  git branch >/dev/null 2>/dev/null && echo "±" && return
  echo '○'
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

function virtualenv_name {
    [ $VIRTUAL_ENV ] && echo '%{$FG[120]%}['`basename $VIRTUAL_ENV`']%{$reset_color%}'
}

local current_dir='${PWD/#$HOME/~}'
local git_info='$(git_prompt_info)'
local prompt_char='$(prompt_char)'


PROMPT="╭─%{$FG[244]%}%n@$(box_name):$(virtualenv_name)%{$reset_color%}%{$FG[044]%}${current_dir}%{$reset_color%}${git_info} %{$FG[244]%}
╰─${prompt_char}%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[226]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$FG[202]%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$FG[040]%}✔"
