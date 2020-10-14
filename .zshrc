# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/keiththompson/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
plugins=(
  git
)

eval $(thefuck --alias)

alias be='bundle exec'

source $ZSH/oh-my-zsh.sh
source ~/scripts/docker-helpers.bash
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
source '/Users/keiththompson/.ghcup/env'
source '/usr/local/etc/profile.d/z.sh'

PS1='$(kube_ps1)'$PS1
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
source /Users/keiththompson/Desktop/google-cloud-sdk/completion.zsh.inc
#source /Users/keiththompson/Desktop/google-cloud-sdk/path.zsh.inc
source /Users/keiththompson/dotfiles/aliases/*

for f in /Users/keiththompson/dotfiles/aliases/*; do source $f; done
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias undockerize='vim -s ~/undockerize.keys ~/Desktop/s4-prod-core/config/database.yml'

alias dev_vault_token='export VAULT_TOKEN=c94326e3-4288-3853-da62-ffcde41ca8da'
alias dev_vault_addr='export VAULT_ADDR=https://vault.dev.internal.sema4genomics.com:8200'

alias qa_vault_addr='export VAULT_ADDR=https://vault.qa.internal.sema4genomics.com:8200'
alias qa_vault_token='export VAULT_TOKEN=04f467c8-c689-39c8-21c2-90a883ab1370'
alias gpo='git push origin'
alias k='kubectl'
alias kx='kubectx'
alias kns='kubens'
alias br='bin/rspec'
alias glg='git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
alias current-cyan='k get pods | grep '\''cyan'\'' | head -1 | awk '\''{print $1;}'\'''
alias connect-to-cyan='k exec -it $(current-cyan) bash'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/Cellar/kubernetes-cli/1.16.1/bin/kubectl:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="/usr/local/bin/aws:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/keiththompson/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/keiththompson/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/keiththompson/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/keiththompson/google-cloud-sdk/completion.zsh.inc'; fi
