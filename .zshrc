# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_TMUX_AUTOSTART=true

plugins=(git
  tmux
  fzf
  colored-man-pages
  z
  ssh-agent
  gpg-agent
  autojump
  kubectl
)

source $ZSH/oh-my-zsh.sh

EDITOR=vim
export CLANGD_FLAGS="-header-insertion=never --inlay-hints=true --offset-encoding=utf-16"

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias icat="kitty +kitten icat"

function gitpurgemerged() {
  git fetch --all --prune
  git branch -vv | grep ': gone\]' | grep -Eo '\[[^:]+: gone\]' | cut -f1 -d':' | sed 's/\[origin\///g' | xargs git branch -D
}

# environment specific sourcing
[[ ! -f ~/.zshrc.work ]] || source ~/.zshrc.work

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


