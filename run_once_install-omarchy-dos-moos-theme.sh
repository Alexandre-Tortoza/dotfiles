#!/bin/sh

set -e

if [ ! -d "$HOME/.config/omarchy/themes/dos-moos" ]; then
  omarchy theme install https://github.com/HANCORE-linux/omarchy-dos-moos-theme.git
fi