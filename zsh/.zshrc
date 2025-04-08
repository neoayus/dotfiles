# ~/.zshrc

# Zinit plugin manager 
# ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git" 

# Initialize Starship for Zsh
eval "$(starship init zsh)"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Prompt (use Zsh's PROMPT instead of PS1)
# PROMPT='[%n@%m %1~]$ '

# Environment Variables
export EDITOR=$(which nvim)
export SYSTEM_EDITOR=$EDITOR
export VISUAL=$EDITOR

## Java Environment
export JAVA_HOME=/usr/lib/jvm/java-23-openjdk
export PATH=$JAVA_HOME/bin:$PATH




### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# installing plugins 
# zinit light marlonrichert/zsh-autocomplete
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Shortcuts 
alias notes='nvim ~/NotesVault' 
alias work='nvim ~/Hub/stage' 
alias repos='nvim ~/Hub/git' 


# navigation alias 
alias .notes='cd ~/NotesVault' 
alias .cache='cd ~/Hub/cache' 
alias .github='cd ~/Hub/gitHub' 
alias .stage='cd ~/Hub/stage' 
alias .pbl='cd ~/Hub/stage/ProcessSchedulingSimulator' 

