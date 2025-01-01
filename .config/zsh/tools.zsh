# -- zoxide
eval "$(zoxide init zsh)"

# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# -- thefuck
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# -- eza
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

