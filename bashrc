#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias hyprbug="start-hyprland"
blue_bg='\[\e[44m\]'
blue_fg='\[\e[0;34m\]'
black_bg='\[\e[40m\]'
black_fg='\[\e[0;30m\]'
grey_bg='\[\e[100m\]'
grey_fg='\[\e[0;90m\]'
white_bg='\[\e[47m\]'
white_fg='\[\e[0;37m\]'

reset='\[\e[0m\]'

if [ $TERM = "xterm-256color" ]; then 
   PS1="${white_fg}${reset}${black_fg}${white_bg} \w ${reset}${white_fg}${reset} ";
elif [ $TERM = "alacritty" ]; then
   PS1="${white_fg}${reset}${black_fg}${white_bg} \w ${reset}${white_fg}${reset} ";
else
   PS1='\u | \w >';
fi
