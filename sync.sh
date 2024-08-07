#!/bin/bash

set -eu -o pipefail

# Syncs local files

function copy_file {
	set -eu -o pipefail

	local file_name="${1}"
	if [[ "${file_name}" == "./.config/nvim/lua/config/local.lua" ]]; then
		echo "⚠️ Skipping ${file_name}"
		return
	fi

	if [ -f "$HOME/${file_name}" ]; then
		echo "✅ ${file_name}"
		cp "$HOME/${file_name}" "${file_name}"
		git diff --stat ${file_name}
	else
		echo  "❌ ${file_name}"
	fi
}

echo "Legend: ✅ - exists in \$HOME    ❌ - doens't exist in \$HOME"
echo ""

export -f copy_file
find . -type f -not -path "./.git/*" -not -name 'sync.sh' \
	-exec bash -c 'copy_file "$0"' {} \;
