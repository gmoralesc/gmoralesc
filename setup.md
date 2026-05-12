# Mac Web Developer Setup

This guide walks you through setting up a new Mac for web development. The heavy lifting is handled automatically by the configuration files in this repository, leaving only a few manual tweaks for the end.

## 1. Automated Setup
The automated setup uses the provided Brewfile and setup.sh script to install applications, configure macOS defaults, and set up your developer environment.

1. Open the Terminal app.

2. Clone this repository to your local machine:

```
git clone https://github.com/gmoralesc/gmoralesc.git ~/mac-setup
cd ~/mac-setup
```

3. Make the script executable:
```
chmod +x setup.sh
```

4. Run the setup script:
```
./setup.sh
```

Note: The script will automatically install Homebrew, run the Brewfile (installing Chrome, VS Code, Docker, Node.js, PostgreSQL 18, Claude Code, etc.), apply macOS defaults, set up Oh My Zsh, configure your Git details, download your VS Code settings, and import your Terminal theme.

## 2. Manual Steps
Due to macOS security restrictions and application sandbox rules, the following steps must be completed manually after the setup script finishes successfully:

### System

- iCloud: Go to System Settings > Apple ID > iCloud and disable any unused features (like Photos, as it will take up unnecessary disk space).
- Dock: Right-click and delete shortcuts not related to development. Manually drag Terminal and VS Code from your Applications folder to the Dock.
- Finder:
  - Navigate to your newly created ~/Web folder.
  - Drag the Web folder to the left sidebar to create a shortcut.
  - Right-click in a Finder window > Show View Options (Cmd + J):
    - Sort by name
    - Icon size: 72x72
    - Click "Use as Defaults"

### Browser
- Launch Google Chrome and sign in to sync your profile.

### Terminal
- Open Terminal Settings (Cmd + ,) and verify the Tomorrow Night profile is set to Default.
- Ensure the window sizing and fonts are applied correctly under Settings > Profiles > Window:
  - Font Size: 14
  - Window Size: 120 x 32

### Developer Tools
- Open VS Code. If the code terminal command didn't automatically bind to your PATH, press CMD + SHIFT + P, type, and select: "Shell command: Install 'code' command in PATH".

## 3. Git & SSH
Create/Edit your SSH config file:

```
nano ~/.ssh/config
```

Paste the following block, replacing [git host url] (e.g., github.com):

```
Host [git host url]
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/id_rsa_github
```

Copy your generated public key to your clipboard:
```
cat ~/.ssh/id_rsa_github.pub | pbcopy
```

Go to your Git hosting provider (GitHub/GitLab) settings and paste the copied key into your SSH Keys section.
