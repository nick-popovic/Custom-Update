# Custom-Update
Simplified package manager where you run only 1 command to update all packages based on your OS and package manager on CLI.

## Artifacts
    - install.sh - moves the following files to `/usr/local/bin` and overwrites if they exist.
        - `.update` - Welcome message file
        - `update` - The main script that handles the update process.
        - make sure to give `install.sh` executable permission: `chmod +x install.sh` (or just move files manually as needed)

## Features (so far):
- Runs on:
  - macOS (brew)
  - linux (apt | pacman | yay)

## TO-DO
- Consider support for:
  - Windows (winget | chocolatey | scoop ..etc)
