#!/bin/sh

###############################################################################
# Dock                                                                        #
###############################################################################

# Move to left
defaults write com.apple.dock orientation left

# Set the dock size
defaults write com.apple.dock tilesize -int 24;

# Disable resize dock
defaults write com.apple.dock size-immutable -bool true;

# Lock the Dock Contents
defaults write com.apple.Dock contents-immutable -bool yes;

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# No bouncing icons
defaults write com.apple.dock no-bouncing -bool true

# Disable hot corners
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-br-corner -int 0

# Don't show recently used applications in the Dock
defaults write com.Apple.Dock show-recents -bool false

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/Spark.app"
dockutil --no-restart --add "/Applications/Whatsapp.app"
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/System/Applications/System Preferences.app"
dockutil --no-restart --add '~/Downloads' --view grid --display folder

killall Dock