#!/bin/bash

project
status=""
if [[ "$(watson status)" == "No project started." ]]; then
	status=""
  project="<no project>"
else
  project=$(watson status | cut -d' ' -f2)
fi
# total=$(watson report -dcG | grep 'Total:' | sed 's/Total: //')
printf "%s %s" "${status}" "${project}"
