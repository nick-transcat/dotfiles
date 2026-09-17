# ============================================================================
# Powerlevel10k Instant Prompt (Must stay near the top)
# ============================================================================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ============================================================================
# Oh My Zsh Configuration
# ============================================================================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# ============================================================================
# Environment Variables
# ============================================================================
export PATH="$HOME/.local/bin:$PATH"

# Disable AWS CLI's pager (avoids output opening in less/vi-like screen)
export AWS_PAGER=""

# Use system (macOS keychain) trust store for uv/uvx — helps when corporate
# SSL inspection breaks uv's bundled cert store
export UV_SYSTEM_CERTS=1

# Auto-load an SSH key on shell start, if present
ssh-add -q ~/.ssh/id_ed25519 2>/dev/null

# ============================================================================
# Tool Initializations
# ============================================================================
eval "$(zoxide init zsh)"

[[ -f "$HOME/.atuin/bin/env" ]] && . "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"

# ============================================================================
# Custom Aliases
# ============================================================================
# General
alias vi="nvim"
alias c="clear"
alias e="exit"
alias check="clear && npm run test && npm run build"
alias nodes="lsof -i -P -n | grep node"
alias co="copilot"
alias oc="opencode"
alias ta="tmux attach"
alias lll="ls -lhA | awk '{print \$9, \$5}' | column -t"
alias la="lazygit"

# NPM
alias d="npm run dev"
alias npml="npm run lint"
alias npmf="npm run format"
alias npmb="npm run build"
alias npmt="npm run test"

# NPX
alias npt="npx playwright test"
alias nps="npx playwright show-report"

# Git
alias p="git pull"
alias trim="git branch -D"
alias grow="git switch -C"
alias branch="git branch"
alias m="git switch main"
alias gs="git status"
alias status="git status && git diff --stat"
alias configs="git config user.name && git config user.email"
alias slint="git diff --cached --name-only --diff-filter=ACMR | grep -E '\.(js|jsx|ts|tsx)$' | xargs -I{} npx next lint --file {}"

# ============================================================================
# Custom Functions
# ============================================================================
# Create a new git worktree branched off main, with env files symlinked and deps installed
wt() {
  local branch="$1"
  if [[ -z "$branch" ]]; then
    echo "Usage: wt <branch-name>"
    return 1
  fi
  local main_dir="$(git rev-parse --show-toplevel 2>/dev/null)"
  if [[ -z "$main_dir" ]]; then
    echo "Not inside a git repository"
    return 1
  fi
  local new_dir="${main_dir}-${branch}"

  git fetch origin main
  git worktree add -b "$branch" "$new_dir" origin/main || return 1
  [[ -f "$main_dir/.env" ]] && ln -sf "$main_dir/.env" "$new_dir/.env"
  npm install --prefix "$new_dir"
  echo "Worktree ready at $new_dir"
}

# Open the GitHub page for the repo in the current directory (or a subpath/branch on it)
gho() {
  local remote_url
  remote_url="$(git config --get remote.origin.url 2>/dev/null)"
  if [[ -z "$remote_url" ]]; then
    echo "Not inside a git repository (or no 'origin' remote)"
    return 1
  fi

  # Normalize git@github.com:org/repo.git and https://github.com/org/repo.git -> https://github.com/org/repo
  local repo_url="$remote_url"
  repo_url="${repo_url%.git}"
  if [[ "$repo_url" == git@*:* ]]; then
    local host="${repo_url#git@}"
    host="${host%%:*}"
    local repo_path="${repo_url#*:}"
    repo_url="https://${host}/${repo_path}"
  fi

  open "$repo_url"
}

# ============================================================================
# Theme Configuration
# ============================================================================
# Powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
