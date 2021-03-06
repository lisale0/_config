# If you come from bash you might have to change your $PATH.

# Path to your oh-my-zsh installation

fpath=(/usr/local/share/zsh-completions $fpath)

# ================================================================================
#   zplug
# ================================================================================

if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug $HOME/.zplug
    source $HOME/.zplug/init.zsh && zplug update --self
fi

source $HOME/.zplug/init.zsh


# Convenient stuff from prezto
zplug 'modules/editor', from:prezto
zplug 'modules/completion', from:prezto
zplug 'modules/history', from:prezto

# The platinum searcher
zplug 'monochromegane/the_platinum_searcher', as:command, rename-to:pt, from:gh-r

# ripgrep
zplug 'BurntSushi/ripgrep', as:command, rename-to:rg, from:gh-r


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load # --verbose

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fix: (eval):setopt:3: no such option: NO_warnnestedvar
_comp_options="${_comp_options/NO_warnnestedvar/}"


# ================================================================================
#   Initialize Variables
# ================================================================================
eval "$(rbenv init -)"
eval "$(pyenv init -)"

if [[ -d $HOME/bin ]]; then
    PATH="$HOME/bin:${PATH}"
fi

# ================================================================================
#   Alias
# ================================================================================
alias be='bundle exec'
alias la='ls -A'
alias sl='ls'
alias lla='ls -la'
alias gsu='git submodule update'

# ================================================================================
# Cerego Alias
# ================================================================================

alias gogo_testing="cd ~/Cerego/chef-ctl; ./chef-ctl ssh -n testing"
alias gogo_admin="cd ~/Cerego/chef-ctl/; echo -ne '\033]0;'!! PROD !!'\007'; ./chef-ctl ssh -n admin"
alias gogo_stable="cd ~/Cerego/chef-ctl; ./chef-ctl -e stable; ./chef-ctl ssh -e stable -n background"

# ================================================================================
#   Environment Variables
# ================================================================================
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/usr/local/opt/node@8/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export HISTFILESIZE=10000

# ssh
export SSH_KEY_PATH="~/.ssh/"

export EDITOR='emacs'


# ===========================================

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
