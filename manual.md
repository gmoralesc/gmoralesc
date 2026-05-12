# Manual steps

## Apple customization

- iCloud Settings: Apple heavily locks down iCloud preferences. Disabling features like Photos must be done manually via System Settings.
- Dock Customization: While there is a tool called dockutil, Apple frequently changes how the Dock is structured. Dragging your apps and removing the default shortcuts manually takes 30 seconds and is guaranteed to work.

## Broswer

- Browser Sign-in: Security constraints prevent you from automating your Google Chrome sign-in.

## Terminal

- Terminal Theme: Downloading the raw .terminal file via script is easy, but importing it and setting it as the default via the CLI requires complex AppleScript. It is highly recommended to do the Settings > Profile > Import step manually.
- SSH Config & GitHub Upload: The script above generates the key, but you will still need to manually copy ~/.ssh/id_rsa_github.pub and paste it into your Git provider's settings.
