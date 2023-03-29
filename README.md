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

## Additional Tweaks

1. Add `.rgignore` in source tree to disable listing `.cache` files:
```sh
.cache/*
```
1. Global GIT ignore of special files:
```sh
git config --global core.excludesFile '~/.gitignore'
```

1. Add `.clangd` file in source tree that points to compilation database:

```
CompileFlags:
  CompilationDatabase: /home/stone/source
```

# Extra Plugins

1. See `local.plugins.yaml`

# Don't forget directory local `.local.vimrc`!

Example:

    let
    g:cmake_build_dir='/home/stone/build

    set tabstop=4
    autocmd FileType cpp setlocal tabstop=4 shiftwidth=4

# Installation (for i3)

1. Copy `i3exit` to /usr/local/bin
1. Copy `config` to `$HOME/.config/i3/config`

# Installation (for Mac)

1. Follow [installation guide](https://cbrgm.net/post/2021-05-5-setup-macos/)
for `yabai` and `skhd`. Configuration files for `~/.yabairc` and `~/.skhdrc`
are in this repo
2. Remap keys with *Karabiner elements* if wished.

