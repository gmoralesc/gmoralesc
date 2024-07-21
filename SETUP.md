# Apple Developer Setup

## System
- iCloud: Disable any unused features (Like photos because it will take a lot of space)
- Dock: Delete shorcuts not related to development
- Finder: Preferences
  - General > New Finder window show: [username]
  - Sidebar > Show these items in the sidebar: [username]
  - Show view options:
    - Short by name
    - 72x72 size
    - Use as Defaults
  - Create "Web" folder in [username]'s root
  - Add "Web" shorcut in the sidebar

## Browser
- Download Google Chrome
- Sign In

## Terminal
- Add Terminal shorcut in Dock
- Install [Oh My zsh](https://ohmyz.sh/)
- Install [OS X Terminal/Tomorrow Night.terminal](https://github.com/chriskempson/tomorrow-theme/blob/master/OS%20X%20Terminal/Tomorrow%20Night.terminal)
  - Download raw file
  - Terminal > Settings > Profile > ... > Import
    - Select "Tomorrow Night" > Default
    - Font Size: 14
  - Terminal > Settings > Window > Windows Size > 120 x 32
- Install [Brew](https://brew.sh/) (It will install Command Line Tools for Xcode automatically)
- Update Brew path in zsh
  - `nano .zshrc`
  - Add to the bottom: `export PATH="/opt/homebrew/bin:$PATH"`

## Developer Tools
- Install [Node.js version Manager (nvm)](https://github.com/nvm-sh/nvm)
- Install [Node.js](https://nodejs.org/en/)
  -  `nvm install stable`
- Install and add shorcut in the Dock [Visual Studio Code](https://code.visualstudio.com/)
  - Theme: [Tomorrow Night](https://marketplace.visualstudio.com/items?itemName=ms-vscode.Theme-TomorrowKit)
  - Extensions:
    - [Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
    - [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
    - [TODO Highlight](https://marketplace.visualstudio.com/items?itemName=wayou.vscode-todo-highlight)
    - [ES7+ React/Redux/React-Native snippets](https://marketplace.visualstudio.com/items?itemName=dsznajder.es7-react-js-snippets)
    - [Tailwind CSS IntelliSense](https://marketplace.visualstudio.com/items?itemName=bradlc.vscode-tailwindcss)
  - My recommended settings: [settigns.json](https://gist.github.com/gmoralesc/cb44947e93f4071cc309b04a50101776)
  - Terminal PATH: `CMD + SHIFT + P`: "Shell command: Install 'code' command in PATH"
- Install [Docker Desktop](https://www.docker.com/products/docker-desktop/)

## Git
- Configuration
  - `git config --global user.name "[name]"`
  - `​git config --global user.email [email]`
  - `git config --global core.editor nano`
- SSH
  - `mkdir .ssh`
  - `ssh-keygen -t rsa -b 2048 -C "[name]"` (Follow instructions)
  - `nano ~/.ssh/config`
    - ```
      Host [git host url]
      PreferredAuthentications publickey
      IdentityFile ~/.ssh/[keyname]
      ```
  - `cat [keyname].pub` > Add to SSH Keys in the "Git host"
