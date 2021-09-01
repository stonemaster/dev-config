# Additional packages

 1. Oh-my-ZSH: https://github.com/ohmyzsh/ohmyzsh
 1. Powerlevel10k: https://github.com/romkatv/powerlevel10k
    - *Important*: install recommended Meslo font
 1. Install NERD fonts
 1. NVIM Nightly: https://github.com/neovim/neovim/releases/tag/nightly
 1. Git So Fancy: https://github.com/so-fancy/diff-so-fancy

# NVIM as an IDE

1. `git clone git://github.com/rafi/vim-config.git ~/.config/nvim` - see
   https://github.com/rafi/vim-config
1. Copy local configuration files into `~/.config/nvim`: `cp local*
   ~/.config/nvim`
1. Copy `.vault.vim` to `~/.config/nvim`. It disables Q as a default mapping to
   closing the window.
1. In Wayland, install `wl-clipboard` to make system clipboard available

# Extra Plugins

1. See `local.plugins.yaml`

# Don't forget directory local `.local.vimrc`!

Example:

    let
    g:cmake_build_dir='/home/stone/build

    set tabstop=4
    autocmd FileType cpp setlocal tabstop=4 shiftwidth=4

# Installation

1. Copy `i3exit` to /usr/local/bin
1. Copy `config` to `$HOME/.config/i3/config`
