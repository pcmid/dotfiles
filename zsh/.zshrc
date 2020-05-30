# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export TERM="xterm-256color"
export ZSH=/home/id/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
#ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh user dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs)
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git svn)

source $ZSH/oh-my-zsh.sh

# User configuration

# autosuggestions 
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh >/dev/null 2>&1
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh >/dev/null 2>&1
source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh >/dev/null 2>&1
ZSH_AUTOSUGGEST_USE_ASYNC=1


# export MANPATH="/usr/local/man:$MANPATH"
export PATH=${PATH}:/usr/local/bin:/usr/local/opt/gettext/bin

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
 export CLICOLOR=1
 export LSCOLORS=Exfxcxdxbxegedabagacad

# enable color support of ls and also add handy aliases
    #alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
# some more ls aliases
alias ll='llmod'
alias la='ls -A'
alias l='ls -CF'

alias goodnight='shutdown -h now'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias rm='rm -i'
alias c='clear'
alias gcc='gcc -std=c99'
alias pc='proxychains -q'
alias cdd='cd ~/Desktop'
alias ta='tmux attach'
alias mysql='mycli'
alias mux='tmuxinator start'
alias please='sudo'
export TERM=xterm-256color

alias Syu='sudo pacman -Syu'
alias sc='sudo systemctl'
alias ra='ranger'

alias wg='sudo wg'

#alias yay='yay --editmenu -Syu'

# 键
#if [[ -n "$TMUX" ]]; then
#  bindkey "^[[1~" beginning-of-line
#  bindkey "^[[4~" end-of-line
#fi
# http proxy
#export http_proxy=http://127.0.0.1:8118/

#环境变量
export PATH=~/.local/bin:$PATH
unset QT_AUTO_SCREEN_SCALE_FACTOR QT_DEVICE_PIXEL_RATIO QT_IM_MODULE
export VISUAL="vim"
export EDITOR="vim"

#Go
export GOPATH=$HOME/.go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export GO111MODULE=on

#Rust
export PATH=$PATH:$HOME/.cargo/bin
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static

#thefuck
eval $(thefuck --alias)

# gpg-agent
#gpg-connect-agent updatestartuptty /bye >/dev/null 2>&1
export SSH_AUTH_SOCK=/run/user/1000/gnupg/S.gpg-agent.ssh

# 不保留重复的历史

setopt HIST_IGNORE_ALL_DUPS
export HISTSIZE=100000000
export SAVEHIST=$HISTSIZE
