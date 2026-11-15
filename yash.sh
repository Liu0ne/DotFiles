export LANG=C.UTF-8
export LC_ALL=C.UTF-8

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias hyprbug="start-hyprland"

set --le-predict

blue_bg='\[\fB\]'
blue_fg='\[\fb\]'
black_bg='\[\fK\]'
black_fg='\[\fk\]'
grey_bg='\[\fW\]'
grey_fg='\[\fw\]'
white_bg='\[\fWt\]'
white_fg='\[\fwt\]'

reset='\[\fd\]'

PS1="${white_fg}${reset}${black_fg}${white_bg}$PWD${reset}${white_fg}${reset}\n󰥭 "

