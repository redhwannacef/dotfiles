# redhwans-dotfiles

There are all the configuration files I need for my machine.

## Installation

To install from scratch, run:

```bash
curl -fsSL https://raw.githubusercontent.com/redhwannacef/dotfiles/main/install.sh | bash
```

Or clone and run manually:

```bash
git clone https://github.com/redhwannacef/dotfiles.git ~/.local/share/redhwans-dotfiles
cd ~/.local/share/redhwans-dotfiles
./setup.sh
```

To install to a custom location, set the `INSTALL_DIR` environment variable:

```bash
curl -fsSL https://raw.githubusercontent.com/redhwannacef/dotfiles/main/install.sh | INSTALL_DIR=~/my-custom-location bash
```

## Local Development

If you already have the repository cloned, run:

```bash
./setup.sh
```
