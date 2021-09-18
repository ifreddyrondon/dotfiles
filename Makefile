CRR_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
OS := $(shell bin/is-supported bin/is-macos macos linux)
PATH := $(CRR_DIR)bin:$(PATH)

all: preparing $(OS)

preparing:
	@echo Preparing dotfiles
	@echo - Checking installation

linux:
	@echo Linux is not supported yet. Please contact ifreddyrondon@gmail.com to get support

macos: preparing-macos

preparing-macos: brew git zsh oh-my-zsh hammerspoon version-manager langs

brew:
	@echo -- Brew: checking if it is installed
	@(is-executable brew && echo "-- Brew: installed" && echo "-- Brew: updating..." && brew update) || (echo "-- Brew: installing..." && curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby)

git: brew
	@echo -- git: checking if it is installed
	@(brew list git && echo "-- git: installed") || (echo "-- git: installing..." && brew install git)

ZSH_PATH := $(shell which zsh)
zsh: check-install-zsh
	@echo -- zsh: checking if zsh is the default shell
	@(if grep -Fxq "${ZSH_PATH}" /etc/shells; then \
		echo "-- zsh: ${ZSH_PATH} is allowed to be default"; \
	else \
		echo "-- zsh: please run 'sudo sh -c "echo $(which zsh) >> /etc/shells"' and try again"; \
	fi)
	chsh -s $(ZSH_PATH)

check-install-zsh: brew
	@echo -- zsh: checking if it is installed
	@(is-executable zsh && echo "-- zsh: installed") || (echo "-- zsh: installing..." && brew install zsh)

oh-my-zsh:
	@echo -- oh-my-zsh: checking if it is installed
	@(if [ -d "${HOME}/.oh-my-zsh" ]; then \
		echo "-- oh-my-zsh: installed"; \
	else \
		echo "-- oh-my-zsh: installing..."; \
		curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh; \
	fi)

version-manager: preparing-version-manager n

preparing-version-manager:
	@echo -- version manager: preparing for install version managers

check-install-n: brew
	@echo -- n: checking if it is installed
	@(is-executable n && echo "-- n: installed") || (echo "-- n: installing..." && brew install n)

n: check-install-n
	@(if [ -d /usr/local/n ]; then \
		echo "-- n: folder /usr/local/n ready"; \
	else \
		echo "-- n: creating folder /usr/local/n"; \
		mkdir /usr/local/n; \
		sudo chown -R $(whoami) /usr/local/n; \
	fi)

langs: go

go: brew
	@echo -- go: checking if it is installed
	@(is-executable go && echo "-- go: installed") || (echo "-- go: installing..." && brew install go)

hammerspoon: brew
	@echo -- hammerspoon: checking if it is installed
	@(brew list hammerspoon && echo "-- hammerspoon: installed") || (echo "-- hammerspoon: installing..." && brew install hammerspoon)

packages: brew-packages

brew-packages: brew
	brew bundle --file=$(CRR_DIR)install/Brewfile

defaults: $(OS)-defaults

macos-defaults:
	@for DEFAULTS_FILE in $(CRR_DIR)macos/defaults*.sh; do	\
		echo "Applying $$DEFAULTS_FILE" && . $$DEFAULTS_FILE;		\
	done;
	@echo "Done. Some changes may require a logout/restart to take effect."

update: brew
	brew update
	brew upgrade

clean: brew
	brew cleanup
	n prune
