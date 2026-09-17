# Tools

CLI tools and apps this config expects to be installed (via Homebrew unless noted).

| Tool | What it's for | Install |
| --- | --- | --- |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smarter `cd` (jump to frecent dirs) | `brew install zoxide` |
| [atuin](https://atuin.sh) | Shell history sync/search | `brew install atuin` |
| [lazygit](https://github.com/jesseduffield/lazygit) | Terminal UI for git (`la` alias) | `brew install lazygit` |
| [Oh My Zsh](https://ohmyz.sh) | Zsh framework | see site for install script |
| [Powerlevel10k](https://github.com/romkatv/powerlevel10k) | Zsh prompt theme | `brew install powerlevel10k` |
| [Neovim](https://neovim.io) | Editor (`vi` alias) | `brew install neovim` |
| [tmux](https://github.com/tmux/tmux) | Terminal multiplexer | `brew install tmux` |
| [GitHub Copilot CLI](https://docs.github.com/copilot/how-tos/set-up/install-copilot-cli) | AI pair programmer in the terminal (`co` alias) | `npm install -g @githubnext/github-copilot-cli` |
| [opencode](https://opencode.ai) | Terminal AI coding agent (`oc` alias) | see site for install |

After installing zoxide and atuin, `.zshrc` initializes them automatically:

```sh
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"
```
