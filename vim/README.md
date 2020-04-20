# NVIM as an IDE

1. `git clone git://github.com/rafi/vim-config.git ~/.config/nvim` - see
   https://github.com/rafi/vim-config
1. Copy local configuration files into `~/.config/nvim`: `cp local*
   ~/.config/nvim`

# Extra Plugins

1. See `local.plugins.yaml`

# Don't forget directory local `.local.vimrc`!

Example:

  let
  g:cmake_build_dir='/home/stone/build

  set tabstop=4
  autocmd FileType cpp setlocal tabstop=4 shiftwidth=4

