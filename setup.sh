#!/usr/bin/env bash

# Brew installation
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed, skipping installation"
fi

brew bundle --file __setup/Brewfile
brew cu -a

# sdkman installation
#if [[ ! -v SDKMAN_DIR ]]; then
#    curl -s "https://get.sdkman.io" | bash
#    source "$HOME/.sdkman/bin/sdkman-init.sh"
#    sdk install java 21.0.3-tem
#else
#    echo "Sdkman is already installed, skipping installation"
#fi

# folders should be installed for all users including the root user
base=(
    zsh
)

# folders that only need to be installed for local user
useronly=(
    bin
    gh
    git
)

# run the stow command for the passed in directory ($2) in location $1
stowit() {
    usr=$1
    app=$2
    # -v verbose
    # -R recursive
    # -t target
    stow -v -R -t ${usr} ${app}
}

echo ""
echo "Stowing apps for user: ${whoami}"

# install apps available to local users and root
for app in ${base[@]}; do
    stowit "${HOME}" $app 
done

# install only user space folders
for app in ${useronly[@]}; do
    if [[ ! "$(whoami)" = *"root"* ]]; then
        stowit "${HOME}" $app 
    fi
done

echo ""
echo "##### ALL DONE"
