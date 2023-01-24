# .zshrc

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

export EDITOR='nvim'
export VISUAL='nvim'

setopt inc_append_history
setopt extended_history
setopt hist_ignore_space
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_expire_dups_first
setopt interactive_comments

# Emacs bindings
bindkey -e

# Custom key bindings. Get key codes with "showkey -a" or "cat >/dev/null"
# ctrl-left and ctrl-right
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# ctrl-bs and ctrl-del
bindkey '^H'      backward-kill-word
bindkey '^[[3;5~' kill-word

# del, home, end
bindkey '^[[3~' delete-char
bindkey '^[[H'  beginning-of-line
bindkey '^[[F'  end-of-line

# Completions for docker
fpath=(/usr/share/zsh/vendor-completions $fpath)

zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*:descriptions' format '%F{green}-- %d --%f'
#zstyle ':completion:*' file-list all
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=1
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:*:kill:*' list-colors '=(#b) #([0-9]#)*( *[a-z])*=34=31=33'
zstyle ':completion:*:*:docker:*' verbose no
zstyle ':completion:*:*:podman:*' verbose no

zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit

autoload -Uz tetriscurses
alias tetris='tetriscurses'

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

alias l='ls -ltr --color=auto'
alias la='ls -la --color=auto'
alias ll='ls -l --color=auto'
alias myip='curl https://ipinfo.io/ip/'
alias myip-full='curl https://ipinfo.io/'
alias myip-viadns='dig +short myip.opendns.com @resolver1.opendns.com'
alias weather='curl https://wttr.in/'
alias weather2='curl https://v2.wttr.in/'
alias weather-stockholm2='curl https://v2.wttr.in/Stockholm'

PROMPT="%(?.%F{040}%}.%F{124}%})%(?..[%?] )%n@%m%f:%F{111}%~%f %# "
#RPROMPT="%(?.%F{040}%}.%F{124}%})%*%f"

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HISTORY_IGNORE="cd *"
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# >>>> Vagrant command completion (start)
fpath=(/usr/share/vagrant/gems/gems/vagrant-2.2.19/contrib/zsh $fpath)
compinit
# <<<<  Vagrant command completion (end)
