# Custom-Update

A simplified utility script where you run only 1 command to update all packages based on your OS and package manager.

## Features

- **macOS**: Updates and upgrades packages via `brew`.
- **Linux**: Automatically detects and uses the appropriate package manager:
  - `apt` (Debian/Ubuntu based systems)
  - `pacman` (Arch Linux based systems)
  - `yay` (AUR helper for Arch Linux)
- Offers an interactive prompt to perform a full system update, upgrade, and cache clean-up in one go.
- Fully self-contained script with a built-in ASCII banner.

## Installation

You can install the `update` command by piping the installation script directly to bash. By default, it will download the latest release and install it to `~/.local/bin`.

```bash
curl -sLf https://raw.githubusercontent.com/nick-popovic/Custom-Update/master/install.sh | bash
```

If you prefer to install it to a different directory, you can pass the path as an argument to the script:
```bash
curl -sLf https://raw.githubusercontent.com/nick-popovic/Custom-Update/master/install.sh | bash -s -- /usr/local/bin
```

*Note: If you install to a custom directory or `~/.local/bin`, make sure it is included in your system's `$PATH`.*

## Usage

Simply run the command in your terminal:
```bash
update
```

The script will ask if you want to proceed with a full update, upgrade, and cleanup sequence based on your system configuration. If you opt-in, it will automatically execute the necessary commands.
