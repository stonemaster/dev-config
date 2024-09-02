# If this module depends on an external Tmux plugin, say so in a comment.
# E.g.: Requires https://github.com/aaronpowell/tmux-weather
#
# Adapted from documentation: https://github.com/catppuccin/tmux/blob/main/custom/README.md
# With help of: https://github.com/elijahmanor/dotfiles/blob/master/tmux/.tmux/watson.sh

show_watson() { # This function name must match the module name!
  local index icon color text module project watson_status

  index=$1 # This variable is used internally by the module loader in order to know the position of this module
  icon="$(  get_tmux_option "@catppuccin_watson_icon"  ""           )"
  color="$( get_tmux_option "@catppuccin_watson_color" "$thm_orange" )"

	local status=""
	if [[ "$(watson status)" == "No project started." ]]; then
		status=""
    project="<no project>"
  else
    project=$(watson status | cut -d' ' -f2)
	fi
	# total=$(watson report -dcG | grep 'Total:' | sed 's/Total: //')
  watson_status=$(printf "%s %s" "${status}" "${project}")
  text="$(  get_tmux_option "@catppuccin_watson_text"  "${watson_status}" )"

  module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
