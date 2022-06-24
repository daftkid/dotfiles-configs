# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

export ZSH="${HOME}/.oh-my-zsh"

#### GPG configs ####
GPG_TTY=$(tty)
export GPG_TTY

# ZSH theme
ZSH_THEME="bullet-train"

#### BULLET-TRAIN THEME ####
BULLETTRAIN_STATUS_EXIT_SHOW=true
BULLETTRAIN_GIT_PREFIX=""
BULLETTRAIN_GIT_DIRTY=" %F{red}✘%F{black}"
BULLETTRAIN_DIR_EXTENDED=1
BULLETTRAIN_PROMPT_CHAR='🌱 >'
BULLETTRAIN_EXEC_TIME_ELAPSED="1"
BULLETTRAIN_EXEC_TIME_BG="blue"
BULLETTRAIN_VIRTUALENV_BG="cyan"
BULLETTRAIN_KCTX_BG="magenta"
BULLETTRAIN_KCTX_FG="black"
BULLETTRAIN_KCTX_PREFIX="☸️ "
BULLETTRAIN_KCTX_NAMESPACE="false"

BULLETTRAIN_PROMPT_ORDER=(
  time
  dir
  kctx
  aws
  git
  status
  cmd_exec_time
)

#### LOCALES ####
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export AWS_SDK_LOAD_CONFIG=1

#### ZSH PLUGINS ####
plugins=(
  virtualenv
  docker
  git python
  zsh-syntax-highlighting
  zsh-autosuggestions
  docker-compose
  kubectl
)

source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=241'

prompt_context(){}
ZSH_HIGHLIGHT_STYLES[path]=none

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault

#### ALIASES ####
# git
alias g="git"
alias gpull="git pull"
alias gpush="git push origin"
alias gc="git commit"
alias gch="git checkout"
alias gs="git status -s"
alias gist="git stash"
alias gista="git stash apply"
alias gistl="git stash list"

alias delbf="git branch | grep -v master | xargs git branch -D"
alias delb="git branch | grep -v master | xargs git branch -d"

# terraform
alias tf="terraform"
alias tg="terragrunt"
alias tga="terragrunt apply"
alias tgp="terragrunt plan"
alias tgd="terragrunt destroy"
alias tgi="terragrun import"
alias tgf="terragrunt hclfmt"

alias kc="kubectl"
alias p3="python3"
alias h="helm"
alias v="vault"
alias myip="curl -s ifconfig.me | pbcopy"

alias kcns="kubectl config view --minify --output 'jsonpath={..namespace}'"

# EDITORS
export EDITOR="nvim"

alias c="code"
alias n="nvim"

## GoLang vars
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go@1.18/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

WORDCHARS='~!#$%^&*(){}[]<>?+;'

export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/usr/local/opt/libpq/bin:$PATH"

test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)
