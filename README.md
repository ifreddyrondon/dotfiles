# dotfiles

These are my dotfiles. Take anything you want, but at your own risk.

It targets macOS systems, linux is not supported right now.

## Package overview

- [Homebrew](https://brew.sh) and [homebrew-cask](https://caskroom.github.io) (packages:
- Latest Git, Zsh, oh-my-zsh, Go, GNU coreutils
- [Hammerspoon](https://www.hammerspoon.org)

## Install

On a sparkling fresh installation of macOS:

    sudo softwareupdate -i -a
    xcode-select --install

The Xcode Command Line Tools includes `git` and `make` (not available on stock macOS).
Then, install this repo with `curl` available:

    curl -sSL https://git.io/Jvrar | sh -s

This will clone (using `git`), or download (using `curl` or `wget`), this repo to `~/.dotfiles`. Alternatively, clone manually into the desired location:

    git clone https://github.com/ifreddyrondon/dotfiles.git ~/.dotfiles

Use the [Makefile](./Makefile) to install everything [listed above](#package-overview)

    cd ~/.dotfiles
    make

## Post-install

- `make defaults` (set [system defaults](./macos/))
- Mackup
  - use the installation process for mackup https://github.com/ifreddyrondon/mackup.git


## Additional resources

- [Awesome Dotfiles](https://github.com/webpro/awesome-dotfiles)
- [Homebrew](https://brew.sh)
- [Homebrew Cask](http://caskroom.io)
- [Bash prompt](https://wiki.archlinux.org/index.php/Color_Bash_Prompt)
- [Solarized Color Theme for GNU ls](https://github.com/seebi/dircolors-solarized)

## Credits

Many thanks to the [dotfiles community](https://dotfiles.github.io).