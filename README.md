# redhwans-dotfiles

Configuration files and setup scripts for Unix-based development environments.

## How It Works

`setup.sh` symlinks config files from `config/` to `~/.config/` and runs
package installation scripts from `packages/`. Each package script defines
dependencies and setup steps.

## Installation

To install from scratch, run:

```bash
curl -fsSL \
  https://raw.githubusercontent.com/redhwannacef/dotfiles/main/install.sh \
  | bash
```

Or clone and run manually:

```bash
git clone https://github.com/redhwannacef/dotfiles.git \
  ~/.local/share/redhwans-dotfiles
cd ~/.local/share/redhwans-dotfiles
./setup.sh
```

To install to a custom location, set the `INSTALL_DIR` environment variable:

```bash
curl -fsSL \
  https://raw.githubusercontent.com/redhwannacef/dotfiles/main/install.sh \
  | INSTALL_DIR=~/my-custom-location bash
```

## Package structure

A package is an implementation of an interface that exports the
following functions:

- `packages`: The packages to be installed (space separated, these are the
  names that home brew recognises)

- `config_dir`: The name of the directory for the matching config that lives in
  the `config` directory.

- `setup`: Any addition setup commands required for setup.

## Included Packages

### **git**

Sets up git configuration.
There is additionally a `config/git/user-config` file which takes manual input
during setup for name and email.
This file is not committed to keep email out of git.

### **fish**

Entry point is `config.fish`, this sets up aliases, fish prompt etc.
The `config/fish/config.local.fish` for environment variable that should not be
committed. They can be set with `set -x KEY VALUE`.

### **nvim**

Neovim configuration

## Local Development

If you already have the repository cloned, run:

```bash
./setup.sh
```
