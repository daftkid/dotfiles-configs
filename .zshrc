# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="${HOME}/.oh-my-zsh"

#### GPG configs ####
export GPG_TTY=$TTY

# ZSH theme
ZSH_THEME="powerlevel10k/powerlevel10k"

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
ZSH_HIGHLIGHT_STYLES[path]='none'

autoload -U +X bashcompinit && bashcompinit

#### ALIASES ####
# git
alias g="git"
alias gpush="git push origin"
alias gc="git commit"
alias gcm="git commit -m"
alias gch="git checkout"
alias gs="git status -s"
alias gst="git stash"
alias gsta="git stash apply"
alias gstl="git stash list"

alias delbf="git branch | grep -v master | xargs git branch -D"
alias delb="git branch | grep -v master | xargs git branch -d"

# terraform
alias tf="terraform"
alias tg="terragrunt"
alias tga="terragrunt apply"
alias tgp="terragrunt plan"
alias tgd="terragrunt destroy"
alias tgi="terragrunt init"
alias tgim="terragrunt import"
alias tgf="terragrunt hclfmt"
alias tl="tflint"
alias prepare_tf_module="touch main.tf variables.tf outputs.tf versions.tf data.tf"

alias kc="kubectl"
alias p3="python3"
alias h="helm"
alias v="vault"
alias myip="curl -s ifconfig.me | pbcopy"

alias ll="ls -al"

# EDITORS
export EDITOR="nvim"
alias c="code"
alias n="nvim"

## GoLang vars
export GOPATH=$HOME/golang
export PATH=$PATH:$GOPATH/bin

export TFLINT_CONFIG_FILE=~/.terraform.d/.tflint.hcl
export TERRAGRUNT_PROVIDER_CACHE=1

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="/opt/homebrew/bin:$PATH"

export PATH="`python3 -m site --user-base`/bin:$PATH"
alias awsume=". awsume"

# ASDF
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# k9s
export K9S_CONFIG_DIR="${HOME}/.config/k9s"
