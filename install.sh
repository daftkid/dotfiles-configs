#!/usr/bin/env bash

echo "Installing Oh-My-ZSH"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Done!"

# Install all Brew packages
brew bundle install

# Install ASDF plugins
asdf plugin add terragrunt
asdf plugin add terraform

asdf install

# Copy files
cp ./.p10k.zsh ./.zshrc ./.tmux.conf ~/
cp -R ./nvim ~/.config/
