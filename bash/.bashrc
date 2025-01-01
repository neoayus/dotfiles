#
# ~/.bashrc
#
eval "$(starship init bash)"
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export EDITOR=$(which nvim)
export SYSTEM_EDITOR=$EDITOR
export VISUAL=$EDITOR 

# qt-utils 
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_QPA_PLATFORMTHEME="qt6ct"


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
