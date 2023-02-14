# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/jasonbrewer/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="crunch"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git pdm)

source $ZSH/oh-my-zsh.sh

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Regular aliases
alias ffs='sudo "$BASH" -c "$(history -p !!)"'
alias bi='brew install'
alias br='brew uninstall'
alias bu='brew update'

# Git
## Git aliases
alias g='git'
alias gfu='git fetch upstream'
alias gfo='git fetch origin'
alias gr='git rebase'
alias gpull='git pull'
alias gs='git status'
alias gc='git checkout'
alias gl="git log --pretty=format:'%Cblue%h%Creset%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)%an%Creset' --abbrev-commit --date=relative"
alias gbranches='git branch -a'
alias gnb='git checkout -b'
alias gnewbranch='git checkout -b'
alias grmbranch='git branch -d'
alias gd='git diff'
alias gss='git stash save'
alias gsp='git stash pop'
alias gsl='git stash list'
alias ga='git add'
alias gaa='git add -A'
alias gcom='git commit'
alias gcommam='git add -A && git commit -m'
alias gcomma='git add -A && git commit'
alias gcommend='git add -A && git commit --amend --no-edit'
alias gm='git merge'
alias gcp='git cherry-pick'
alias gpoh='git push origin HEAD'
alias grom='git rebase origin/master'
alias gcd='cd ~/repos/'
### From https://docs.gitlab.com/ee/user/project/merge_requests/#checkout-merge-requests-locally : e.g. gcmr upstream 12345
gcmr() { git fetch $1 merge-requests/$2/head:mr-$1-$2 && git checkout mr-$1-$2; }
### This function prunes references to deleted remote branches and
### deletes local branches that have been merged and/or deleted from the remotes.
### It is intended to be run when on a master branch, and warns when it isn't.
### Function to take git interactive rebase argument. e.g.: gir 2
gri() { git rebase -i HEAD~$1; }
gir() { git rebase -i HEAD~$1; }
### Function to undo all changes (including stages) back to the last commit, with a confirmation.
gundoall () {
  echo "WARNING: This will delete all untracked files, and undo all changes since the last commit."
  read -r -p "Are you sure? [y/N] " response
  if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
  then
    echo "===== 1/2: git reset --hard HEAD =====" \
    && git reset --hard HEAD \
    && echo "===== 2/2: git clean -fd \$(git rev-parse --show-toplevel) =====" \
    && git clean -fd $(git rev-parse --show-toplevel)
  else
    echo "Aborted. Nothing was changed."
  fi
}

## JB ALIASES

alias getDev='git fetch && git checkout develop && git pull'
alias getMas='git fetch && git checkout master && git pull'
alias getMan='git fetch && git checkout main && git pull'
alias gs='git status'
alias ns='npm run start'
alias nt='npm test'
alias cdP='cd ~/workshop'
alias c='clear'
alias r='reset'
alias src='source ~/.zshrc'
alias ownAll='sudo chown -R $USER:$USER *'
alias kad='docker container kill $(docker ps -q)'
alias docip='docker inspect --format='"'"'{{.Name}} {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"'"' $(docker ps -q)'
alias st='speedtest'
alias erc='code ~/.zshrc'
alias grepip='ifconfig | grep inet'
alias isVpnRaw="grepip | grep -q '10\.'"
alias yb="yarn build"
alias yc="alias yc && rm -rf node_modules && yarn"
alias yt="yarn test"
alias WHICH_AWS_ACCOUNT_ID_PLEASE="aws sts get-caller-identity --query Account --output text"
alias temps="sudo powermetrics --samplers smc"
alias iban="echo FR7630001007941234567890185"
alias cpiban="iban | pbcopy"
alias gitPrune-local-branches-not-on-remote="git fetch -p && for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do git branch -D $branch; done"
alias terraMAT="terraform fmt -recursive"
alias yarnLinkPurge="rm -rf ~/.config/yarn/link/*"
alias dependabot-config-generator="dependabot-config-generator"
alias purgeLocalMavenRepo="rm -rf ~/.m2/repository"
alias getIpV4Public="curl https://checkip.amazonaws.com/"

## JB FUNCTIONS

dlf () { docker logs -f $* ;}
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

probably_on_vpn() {
  if ifconfig | grep inet | grep -q '10\.'
  then
    echo "-----------------------------------------------------------------------"
    echo "\xE2\x9C\x85 10.x.x.x IP Found! You're probably on the VPN \xE2\x9C\x85"
    echo "-----------------------------------------------------------------------"
  else
    echo "-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-"
    echo "\xE2\x9D\x8C No 10.x.x.x IP, probably not on the VPN \xE2\x9D\x8C"
    echo "-----------------------------------------------------------------"
  fi
}

alias isVpn=probably_on_vpn

# NVM

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"


# Added by Amplify CLI binary installer
export PATH="$HOME/.amplify/bin:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# For yarn script autocompletion
# https://www.npmjs.com/package/yarn-completion/v/1.0.0

if [ -f ~/yarn-completion.bash ]; then
    . ~/yarn-completion.bash
    __yarn_completion_complete k
fi

# AWS Stuff

export AWS_PROFILE='a-profile'

echo AWS PROFILE = $AWS_PROFILE

# Terraform stuff
export PATH="$HOME/.tgenv/bin:$PATH"

# Personal stuff
export PATH="$HOME/workshop/udx-infra/tooling/bin:$PATH"

# pyenv stuff
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Udemy stuff
# Spark w/Python course

export SPARK_HOME="$HOME/workshop/opt/spark-3.3.0-bin-hadoop3"
export PYSPARK_PYTHON="python"
export PATH="$SPARK_HOME/bin:$PATH"
export PATH="/usr/local/opt/libpq/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

source /Users/jasonbrewer/.docker/init-zsh.sh || true # Added by Docker Desktop
