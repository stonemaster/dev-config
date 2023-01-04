-- ltex-language server
--

local config = {
	filetypes = {
		'bibtex',
		'tex',
		'latex',
		'xhtml',
		'markdown',
		'restructuredtext',
	},
	settings = {
		ltex = {
			language = "auto",
		},
	},
}

return {
	config = function(_)
		return config
	end,
}
