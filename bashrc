#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Alias
alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias neofetch='neofetch --ascii_colors 10 --source ~/.config/neofetch/ascii.txt'

#Local bin folder
export PATH=$PATH":$HOME/.local/bin"

#Colorscheme
(cat ~/.cache/wal/sequences &)

#PS1
bold="\[$(tput bold)\]"
rd="\[$(tput setaf 1)\]"
bl="\[$(tput setaf 4)\]"
gr="\[$(tput setaf 2)\]"
rs="\[$(tput sgr0)\]"

export PS1="${bold}${rd}[${bl}\u@\h ${gr}\w${rd}]${rs}\$ "

#Keyboard layout
setxkbmap -layout latam -model pc105
