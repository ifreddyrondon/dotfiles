#!/bin/sh

###############################################################################
# Dock                                                                        #
###############################################################################

# Move to left
defaults write com.apple.dock orientation left

# Set the dock size
defaults write com.apple.dock tilesize -int 24;

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true


killall Dock