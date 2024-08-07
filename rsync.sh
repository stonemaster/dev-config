#!/bin/bash

set -eu -o pipefail

# Syncs local files to HOME

echo "Copying files to $HOME"
echo ""

files_and_folders=".tmux.conf .zshrc .config"

cp -r -v ${files_and_folders} "$HOME"
