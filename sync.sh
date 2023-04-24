#!/bin/bash

# Syncs local files

find . -type f -not -path "./.git/*" -not -name '*.md' -print -exec cp $HOME/{} {} \;
