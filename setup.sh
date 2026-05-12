#!/usr/bin/env bash

# ==============================================================================
# CONFIGURATION VARIABLES
# Update these URLs and details before running the script
# ==============================================================================

# URLs
HOMEBREW_INSTALL_URL="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"
OH_MY_ZSH_INSTALL_URL="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
VSCODE_SETTINGS_URL="https://gist.githubusercontent.com/gmoralesc/cb44947e93f4071cc309b04a50101776/raw"
TERMINAL_THEME_URL="https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/OS%20X%20Terminal/Tomorrow%20Night.terminal"

# Git & SSH
GIT_USER_NAME="Gustavo Morales"
GIT_USER_EMAIL="gustavo.morales@gmail.com"
SSH_KEY_NAME="id_rsa_github"

# Terminal Theme Name (Must match the name inside the .terminal file exactly)
TERMINAL_THEME_NAME="Tomorrow Night"

# ==============================================================================

echo "Starting Mac Web Developer Setup..."

# 1. Install Homebrew (if not installed)
if test ! $(which brew); then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL $HOMEBREW_INSTALL_URL)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# 2. Run Brewfile
echo "Installing apps and binaries from Brewfile..."
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

# 6. Node.js setup
echo "Setting up Node.js..."
# Create NVM directory and load NVM into the current shell session
export NVM_DIR="$HOME/.nvm"
mkdir -p "$NVM_DIR"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

# Install the latest stable Node.js version
nvm install stable
nvm use stable

# 7. VS Code Setup
echo "Installing VS Code Extensions..."
code --install-extension biomejs.biome
code --install-extension wayou.vscode-todo-highlight
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension bradlc.vscode-tailwindcss
code --install-extension Prisma.prisma
code --install-extension SimonSiefke.svg-preview

echo "Downloading VS Code settings.json..."
curl -o "$HOME/Library/Application Support/Code/User/settings.json" "$VSCODE_SETTINGS_URL"

# 8. Git Setup
echo "Configuring Git..."
git config --global user.name "$GIT_USER_NAME"
git config --global user.email "$GIT_USER_EMAIL"
git config --global core.editor nano

echo "Generating SSH Key..."
mkdir -p ~/.ssh
ssh-keygen -t rsa -b 2048 -C "$GIT_USER_EMAIL" -f ~/.ssh/$SSH_KEY_NAME

# 9. Terminal Theme (Executed last so the pop-up window doesn't interrupt flow)
echo "Configuring Terminal Theme..."
# Download the Tomorrow Night theme to a temporary folder
curl -s -o "/tmp/$TERMINAL_THEME_NAME.terminal" "$TERMINAL_THEME_URL"

# Open the theme file to import it into Terminal app
open "/tmp/$TERMINAL_THEME_NAME.terminal"

# Give Terminal a second to process the import
sleep 2

# Set the Tomorrow Night theme as the default and startup window profile
defaults write com.apple.Terminal "Default Window Settings" -string "$TERMINAL_THEME_NAME"
defaults write com.apple.Terminal "Startup Window Settings" -string "$TERMINAL_THEME_NAME"

echo "Setup script finished! Please review manual steps."
