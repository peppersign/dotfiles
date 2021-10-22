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
alias v='nvim'
alias status='git status -s'

#Local bin bolder
export PATH=$PATH":$HOME/.local/bin"

#Colorscheme
(cat ~/.cache/wal/sequences &)

#Prompt
source ~/.bash_prompt

