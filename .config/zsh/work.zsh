# -- NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm



# Aliases
alias config="cd ~/.config && nvim ."

alias t="tmuxinator start"
alias ts="tmuxinator stop"
alias te="tmuxinator edit"


alias nb="tmuxinator start numbox-backend"
alias nbs="tmuxinator stop numbox-backend"
alias nbe="te numbox-backend"

alias nf="tmuxinator start numbox-clients"
alias nfs="tmuxinator stop numbox-clients"
alias nfe="tmuxinator edit numbox-clients"


