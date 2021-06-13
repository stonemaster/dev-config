#!/bin/bash

# Syncs local files

find . -type f -not -path "./.git/*" -exec echo $HOME/{} {} \;
