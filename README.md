# dotfiles

These are my dotfiles. Take anything you want, but at your own risk.

It targets macOS systems, but it should work on \*nix as well (with `apt-get`).

## Package overview

- [Homebrew](https://brew.sh) and [homebrew-cask](https://caskroom.github.io) (packages:
- [Node.js + npm LTS](https://nodejs.org/en/download/) (packages: [npmfile](./install/npmfile))
- Latest Git, Zsh, Go, Python 3, GNU coreutils, curl
- [Hammerspoon](https://www.hammerspoon.org)
- [Mackup](https://github.com/lra/mackup) (sync application settings)

## Install

On a sparkling fresh installation of macOS:

    sudo softwareupdate -i -a
    xcode-select --install

The Xcode Command Line Tools includes `git` and `make` (not available on stock macOS).
Then, install this repo with `curl` available:

    curl -sSL https://git.io/Jvrar | sh -s

This will clone (using `git`), or download (using `curl` or `wget`), this repo to `~/.dotfiles`. Alternatively, clone manually into the desired location:

    git clone https://github.com/ifreddyrondon/dotfiles.git ~/.dotfiles

Use the [Makefile](./Makefile) to install everything [listed above](#package-overview), and symlink [runcom](./runcom):

    cd ~/.dotfiles
    make

## Post-install

- `dotfiles defaults` (set [system defaults](./macos/))
- Mackup
  - Make sure all your config are `~/.config/mackup/`
  - `dotfiles mackup`

## The `dotfiles` command

    $ dotfiles help
    Usage: dotfiles <command>

    Commands:
       clean            Clean up caches (brew, g, n)
       defaults         Apply os system defaults
       edit             Open dotfiles in IDE (code) and Git GUI (stree)
       help             This help message
       update           Update packages and pkg managers (OS, brew, n)

## Customize/extend

You can put your custom settings, such as Git credentials in the `system/.custom` file which will be sourced from `.zshrc` automatically. This file is in `.gitignore`.

Alternatively, you can have an additional, personal dotfiles repo at `~/.extra`. The runcom `.zshrc` sources all `~/.extra/runcom/*.sh` files.

## Additional resources

- [Awesome Dotfiles](https://github.com/webpro/awesome-dotfiles)
- [Homebrew](https://brew.sh)
- [Homebrew Cask](http://caskroom.io)
- [Bash prompt](https://wiki.archlinux.org/index.php/Color_Bash_Prompt)
- [Solarized Color Theme for GNU ls](https://github.com/seebi/dircolors-solarized)

## Credits

Many thanks to the [dotfiles community](https://dotfiles.github.io).