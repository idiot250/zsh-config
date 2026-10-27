# Only run in interactive shells
[[ -o interactive ]] || return

# Show fastfetch once per terminal
if [[ $SHLVL -eq 1 ]]; then
    fastfetch
    echo
fi

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt autocd
setopt appendhistory
setopt sharehistory

# Better completion
autoload -Uz compinit
compinit

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Better commands
alias ls='eza --icons'
alias ll='eza -lah --icons'
alias cat='bat'

# Prompt
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
export PATH="/opt/brew/bin:$PATH"
export FPATH="/opt/brew/share/zsh/site-functions:$FPATH"

