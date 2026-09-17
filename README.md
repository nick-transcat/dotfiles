# dotfiles

Personal shell, terminal, and editor configuration.

## Contents

- `zsh/.zshrc` — Zsh config (Oh My Zsh + Powerlevel10k, aliases, functions)
- `tmux/tmux.conf` — tmux config (custom prefix, status bar, plugins via TPM)
- `nvim/` — Neovim config (lazy.nvim, LSP, Telescope, Neo-tree, etc.)

## Setup

Symlink the files into place, e.g.:

```sh
ln -sf "$(pwd)/zsh/.zshrc" ~/.zshrc
ln -sf "$(pwd)/tmux/tmux.conf" ~/.tmux.conf
ln -sf "$(pwd)/nvim" ~/.config/nvim
```

### tmux plugins

Uses [TPM](https://github.com/tmux-plugins/tpm). Install it once:

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then in tmux: prefix + `I` to fetch plugins.

## Note

This repo is public — nothing project-specific, or any secret/token/credential,
should ever be committed here.
