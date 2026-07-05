# Custom-Update

Simplified package manager where you run only 1 command to update all packages based on your OS and package manager on CLI.

## Artifacts

    - install.sh - moves the `update` file to `/usr/local/bin` and overwrites if it exists.
        - make sure to give `install.sh` executable permission: `chmod +x install.sh` (or just move files manually as needed)

## Features (so far):

- Runs on:
  - macOS (brew)
  - linux (apt | pacman | yay)
