#!/bin/bash

# Syncs local files

find . -type f -not -path "./.git/*" -not -name '*.md' -exec cp $HOME/{} {} \;
