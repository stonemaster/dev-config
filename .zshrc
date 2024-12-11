# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# += Homebrew
# += Dart Pub cache
# += Flutter
# += Go binaries
export PATH=$HOME/bin:$HOME/.pub-cache/bin:$HOME/.local/bin:$PATH:$HOME/Applications/flutter/bin:$HOME/.local/state/go/bin/
# Rustup and cargo support
. "$HOME/.cargo/env"

# Don't clutter home with `go` folder
export GOPATH="$HOME/.local/state/go"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_TMUX_AUTOSTART=true

plugins=(
  git
  autojump
  colored-man-pages
  direnv
  fzf
  gpg-agent
  kubectl
  pyenv
  ssh-agent
  tmux
  z
)

source $ZSH/oh-my-zsh.sh

export EDITOR=nvim

if [[ $OSTYPE != 'darwin'* ]]; then
  # Works only on X!
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

alias icat="kitty +kitten icat"
alias vimwiki="vim +VimwikiIndex"
alias vim=nvim
alias myip="curl -4 -s https://ifconfig.me"
alias t="todo.sh -d $HOME/.todo-txt/config"

function gitpurgemerged() {
  local origin=${1:-origin}
  git fetch --all --prune
  git branch -vv | grep ': gone\]' | grep -Eo '\[[^:]+: gone\]' | cut -f1 -d':' | sed "s/\[$origin\///g" | xargs git branch -D
}

function _updatenvim_impl() {
  local url="$1"
  local etagfile="${HOME}/.local/state/nvim/nvim.etag"
  etag=$(curl -L --head ${url} 2>/dev/null | grep -i 'etag:' | cut -f2 -d':' | tr -d $'\r')
  if ! diff -q ${etagfile} <(echo ${etag}) 2>/dev/null>/dev/null; then
    echo "NVIM is going to be updated (Etag: ${etag})"
    sudo wget -O /usr/local/bin/nvim.appimage ${url} && echo ${etag} > ${etagfile}
  else
    echo "NVIM already up-to-date (Etag: ${etag})"
  fi
}

function updatenvim() {
  local url="https://github.com/neovim/neovim/releases/download/stable/nvim.appimage"
  _updatenvim_impl ${url}
}

# Just like rsync but will run the provided 
# command line every second.
function rsyncloop() {
  while true; do
    rsync $*
    sleep 1
  done
}

adblog () {
  local application_name=$1
  local pid=$(adb shell pidof -s $application_name)
  adb logcat --pid=$pid
}

function watson_report() {
  #set -x
  local start_date="$1"
  for i in $(seq 0 6); do
    local the_date=$(date -d"$start_date +$i day" +"%Y-%m-%d")
    echo "Date: $the_date"
    watson report -G --from $the_date --to $the_date
    echo "-------------------------------"
  done
}

# environment specific sourcing
[[ ! -f ~/.zshrc.work ]] || source ~/.zshrc.work

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Force nvim colour detection. Use with caution.
export TERM=xterm-kitty

# Show task list if taskwarrior is installed.
if command -v t &> /dev/null; then
  t ls
fi
