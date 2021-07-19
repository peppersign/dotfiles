#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Alias
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias wtr='curl wttr.in'
alias gdb='gdb -q'
alias v='vim'
alias status='git status -s'

#Local bin bolder
export PATH=$PATH":$HOME/.local/bin"

#Colorscheme
#(cat ~/.cache/wal/sequences &)

#Prompt
bold="$(tput bold)"
rd="$(tput setaf 1)"
bl="$(tput setaf 4)"
gr="$(tput setaf 2)"
rs="$(tput sgr0)"

#Test if the tree is clean
function test_tree {
    local state=""
    ! [[ $(git status 2>/dev/null | tail -1) =~ nothing ]] && local state="*"
    echo "$state"
}

#Print the current branch
function git_branch {
    local branch=$(git branch 2>/dev/null)
    local status=$(test_tree)
    git branch --no-color &>/dev/null && local output="─[${bold}${rd}${branch/\* }${status}${rs}${gr}]"
    echo "$output"
}

PS1="\$(git_branch)"
PS1="\[${gr}\]┌─\[${bold}\][\[${bl}\]\u@\h\[${gr}\]]\[${rs}\]\[${gr}\]─[\[${bold}\]\[${gr}\]\w\[${rs}\]\[${gr}\]]\[${PS1}\]\n\[${gr}\]└──╼\[${rs}\] \$ "


