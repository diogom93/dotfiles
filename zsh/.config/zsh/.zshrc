export EDITOR=nvim
export VISUAL=$EDITOR
export HISTCONTROL=ignoredups
export XDG_CONFIG_HOME="$HOME/.config"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export TMUXIFIER_LAYOUT_PATH="$XDG_CONFIG_HOME/tmuxifier"
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
export GOPATH="$HOME/.go"
export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true

# --- zsh plugins ---
source ~/.antidote/antidote.zsh
antidote load "$ZDOTDIR/.zsh_plugins"
# ---

# --- aliases ---
source ~/.aliases
# ---

# --- tmuxifier ---
export PATH="$XDG_CONFIG_HOME/tmux/plugins/tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"
# ---

# --- zoxide ---
eval "$(zoxide init --cmd cd zsh)"
# ---

# --- FZF ---
eval "$(fzf --zsh)"

# --- setup fzf theme ---
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none
  --color=bg+:#2d3f76 \
  --color=bg:#1e2030 \
  --color=border:#589ed7 \
  --color=fg:#c8d3f5 \
  --color=gutter:#1e2030 \
  --color=header:#ff966c \
  --color=hl+:#65bcff \
  --color=hl:#65bcff \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#65bcff \
  --color=query:#c8d3f5:regular \
  --color=scrollbar:#589ed7 \
  --color=separator:#ff966c \
  --color=spinner:#ff007c \
"

# use fd
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# use bat for preview
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# --- rbenv ---
eval "$(rbenv init - zsh)"
# ---

# --- thef*ck ---
eval "$(thefuck --alias)"
# ---

# --- starship ---
eval "$(starship init zsh)"
#

# --- go ---
PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
PATH="$PATH:$(go env $GOPATH)/bin"
