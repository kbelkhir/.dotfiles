# -- NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


# --rbenv
eval "$(rbenv init - zsh)"


# -- JAVA
export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home"

# -- Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

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


