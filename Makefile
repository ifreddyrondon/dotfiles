DOTFILES_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
OS := $(shell bin/is-supported bin/is-macos macos linux)
PATH := $(DOTFILES_DIR)bin:$(PATH)

# .PHONY: test

all: $(OS)

macos: core-macos packages link

linux: core-linux link

core-macos: brew bash git version-manager

core-linux:
	apt-get update
	apt-get upgrade -y
	apt-get dist-upgrade -f

stow-macos: brew
	is-executable stow || brew install stow

stow-linux: core-linux
	is-executable stow || apt-get -y install stow

# sudo:
# 	sudo -v
# 	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

packages: brew-packages node-packages

link: stow-$(OS)
	for FILE in $$(\ls -A runcom); do if [ -f $(HOME)/$$FILE -a ! -h $(HOME)/$$FILE ]; then mv -v $(HOME)/$$FILE{,.bak}; fi; done
	stow -t $(HOME) runcom

unlink: stow-$(OS)
	stow --delete -t $(HOME) runcom
	for FILE in $$(\ls -A runcom); do if [ -f $(HOME)/$$FILE.bak ]; then mv -v $(HOME)/$$FILE.bak $(HOME)/$${FILE%%.bak}; fi; done

brew:
	@(is-executable brew && brew update) || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby

bash: brew
	is-executable zsh || (brew install zsh && chsh -s /bin/zsh)

git: brew
	@(brew list git) || brew install git

brew-packages: brew
	brew bundle --file=$(DOTFILES_DIR)/install/Brewfile
	for EXT in $$(cat install/Codefile); do code --install-extension $$EXT; done

node-packages: n
	npm install -g $(shell cat install/npmfile)

version-manager: asdf asdf-plugins

asdf: brew
	is-executable asdf || brew install asdf

asdf-plugins: asdf-nodejs

asdf-nodejs: brew asdf
	asdf list nodejs || asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
	is-executable gpg || brew install gpg
	is-executable gawk || brew install gawk
	asdf install nodejs latest

mackup: brew
	is-executable mackup && mackup restore

defaults: $(OS)-defaults

macos-defaults:
	@for DEFAULTS_FILE in $(DOTFILES_DIR)/macos/defaults*.sh; do	\
		echo "Applying $$DEFAULTS_FILE" && . $$DEFAULTS_FILE;		\
	done;
	@echo "Done. Some changes may require a logout/restart to take effect."

update: brew
	brew update
	brew upgrade
	mas upgrade

clean: brew
	brew cleanup
	g prune
	n prune

# test:
# 	bats test/*.bats