

# Work
[ -f "$HOME/.config/zsh/work.zsh" ] && source "$HOME/.config/zsh/work.zsh"
[ -f "$HOME/.config/zsh/tools.zsh" ] && source "$HOME/.config/zsh/tools.zsh"

# env
export EDITOR='nvim'

# -- starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
