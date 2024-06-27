# Aliases
alias -- 'gfix'='git add . && git commit --amend --no-edit && git push -f'
alias -- 'kcurrent'='echo -n "context: " && kubectx -c && echo -n "namespace: " && kubens -c'
alias -- 'ls'='ls --color'

# Functions
pgtest() {
  export PGPASSWORD=test && pgcli -h localhost -p $1 -u test -d test -w
}

# Export
export HOMEBREW_BUNDLE_FILE="~/dotfiles/__setup/Brewfile"


# ZSH setup
HISTSIZE="10000"
SAVEHIST="10000"
HISTFILE="$HOME/.zsh_history"
mkdir -p "$(dirname "$HISTFILE")"

source $HOMEBREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(fzf --zsh)"

fpath+=~/.zfunc
autoload -Uz compinit && compinit

# setup starship at the end 
eval "$(starship init zsh)"

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Created by `pipx` on 2024-05-29 07:12:07
export PATH="$PATH:/Users/quentin.vaucher/.local/bin"

export PATH="$PATH:/Users/quentin.vaucher/bin"
