#!/usr/bin/env bash

# ==============================================================================
# CONFIGURATION VARIABLES
# Update these URLs and details before running the script
# ==============================================================================

# URLs
HOMEBREW_INSTALL_URL="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"
OH_MY_ZSH_INSTALL_URL="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
VSCODE_SETTINGS_URL="https://gist.githubusercontent.com/gmoralesc/cb44947e93f4071cc309b04a50101776/raw"

# Git & SSH
GIT_USER_NAME="Gustavo Morales"
GIT_USER_EMAIL="gustavo.morales@gmail.com"
SSH_KEY_NAME="id_rsa_github"

# ==============================================================================

echo "Starting Mac Web Developer Setup..."

# 1. Install Homebrew (if not installed)
if test ! $(which brew); then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL $HOMEBREW_INSTALL_URL)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# 2. Run Brewfile
echo "Installing apps from Brewfile..."
brew bundle

# 3. macOS System Preferences
echo "Configuring macOS..."
# Enable Right Click (Bluetooth Mouse)
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode TwoButton
# Set Finder to open in Home directory
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
# Restart Finder to apply changes
killall Finder

# 4. Create Web Directory
echo "Creating ~/Web directory..."
mkdir -p ~/Web

# 5. Terminal & Shell
echo "Installing Oh My Zsh..."
# Unattended install so the script doesn't pause
sh -c "$(curl -fsSL $OH_MY_ZSH_INSTALL_URL)" "" --unattended

# 6. VS Code Setup
echo "Installing VS Code Extensions..."
code --install-extension biomejs.biome
code --install-extension yoavbls.pretty-ts-errors
code --install-extension wayou.vscode-todo-highlight
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension bradlc.vscode-tailwindcss
code --install-extension Prisma.prisma
code --install-extension SimonSiefke.svg-preview

echo "Downloading VS Code settings.json..."
curl -o "$HOME/Library/Application Support/Code/User/settings.json" "$VSCODE_SETTINGS_URL"

# 7. Git Setup
echo "Configuring Git..."
git config --global user.name "$GIT_USER_NAME"
git config --global user.email "$GIT_USER_EMAIL"
git config --global core.editor nano

echo "Generating SSH Key..."
mkdir -p ~/.ssh
ssh-keygen -t rsa -b 2048 -C "$GIT_USER_EMAIL" -f ~/.ssh/$SSH_KEY_NAME

echo "Setup script finished! Please review manual steps."
