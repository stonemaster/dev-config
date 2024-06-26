# Additional packages

1. [Oh-my-ZSH](https://github.com/ohmyzsh/ohmyzsh)
1. [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
   - *Important*: install recommended Meslo font
1. Install NERD fonts
1. [NVIM Nightly](https://github.com/neovim/neovim/releases/tag/nightly)
1. [git-delta](https://github.com/dandavison/delta)
1. [bat](https://github.com/sharkdp/bat)
1. `fzf`
1. `ripgrep`
1. `direnv` for `.envrc` support
1. TMUX as well as [TPM](https://github.com/tmux-plugins/tpm)
    1. **Important**: Press `prefix + I` as per TPM documentation to install plugins

## NVIM as an IDE

1. *LazyVim* based setup - [https://www.lazyvim.org/]
    1. Just `mv .config/nvim $HOME/.config` and then start `nvim`
1. In Wayland, install `wl-clipboard` to make system clipboard available

## SWAY

1. Install `sway` and `bemenu`

### Extra Plugins

See `.config/nvim/plugins/plugins.lua`

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

```clangd
CompileFlags:
  CompilationDatabase: /home/stone/source
```
