# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/opt/homebrew/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_TMUX_AUTOSTART=true

plugins=(git
  autojump
  colored-man-pages
  direnv
  fzf
  gpg-agent
  kubectl
  kubetail
  ssh-agent
  tmux
  z
)

source $ZSH/oh-my-zsh.sh

EDITOR=vim
export CLANGD_FLAGS="-header-insertion=never --offset-encoding=utf-16"

if [[ $OSTYPE != 'darwin'* ]]; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

alias icat="kitty +kitten icat"
alias vimwiki="vim +VimwikiIndex"
alias vim=nvim

function gitpurgemerged() {
  git fetch --all --prune
  git branch -vv | grep ': gone\]' | grep -Eo '\[[^:]+: gone\]' | cut -f1 -d':' | sed 's/\[origin\///g' | xargs git branch -D
}

function updatenvim() {
  local url="https://github.com/neovim/neovim/releases/download/stable/nvim.appimage"
  local etagfile="${HOME}/.local/state/nvim/nvim.etag"
  etag=$(curl -L --head ${url} 2>/dev/null | grep -i 'etag:' | cut -f2 -d':' | tr -d $'\r')
  if ! diff -q ${etagfile} <(echo ${etag}) 2>/dev/null>/dev/null; then
    echo "NVIM is going to be updated (Etag: ${etag})"
    sudo wget -O /usr/local/bin/nvim.appimage ${url} && echo ${etag} > ${etagfile}
  else
    echo "NVIM already up-to-date (Etag: ${etag})"
  fi
}

# environment specific sourcing
[[ ! -f ~/.zshrc.work ]] || source ~/.zshrc.work

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Force nvim colour detection. Use with caution.
export TERM=xterm-kitty
