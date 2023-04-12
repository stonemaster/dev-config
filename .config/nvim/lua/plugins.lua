return {
	{
		'ilyachur/cmake4vim',
		event = 'BufEnter',
	},
	{
		'OmniSharp/omnisharp-vim',
		event = 'BufEnter',
	},

	--- Spellchecking for comments
	{
		'lewis6991/spellsitter.nvim',
		dependencies= 'nvim-treesitter',
		event = 'BufEnter',
		opts = {
			hooks = {
				post = function()
					require('spellsitter').setup()
				end
			}
		}
	},

	-----------------------------------------------------------------------------
	{
		'ThePrimeagen/refactoring.nvim',
		dependencies= {
			'nvim-treesitter',
			'plenary.nvim'
		},
		event = 'BufEnter',
		keys = {
			{
				';rr',
				function() require('telescope').extensions.refactoring.refactors() end,
				mode = { 'v' }
			}
		},
		opts = {
			hooks = {
				post = function()
					require('refactoring').setup({})
					require('telescope').load_extension("refactoring")
				end
			}
		}
	},

	-- Swap parameters with :ISwap*
	{
		'mizlan/iswap.nvim',
		dependencies= 'nvim-treesitter',
		event = 'BufEnter',
		opts = {
			hooks = {
				post = function()
					require('iswap').setup{}
				end
			}
		}
	},


	-- Hexmode plugin via `:Hexmode`
	{
		'fidian/hexmode',
		event = 'BufEnter',
	},

	-- Inlayhints for LSP servers
	{
		'lvimuser/lsp-inlayhints.nvim',
		event = 'BufEnter',
		opts = {
			hooks = {
				post = function()
					require("lsp-inlayhints").setup()
				end
			}
		}
	},

	-- Markdown preview via :MarkdownPreview
	{
		'iamcco/markdown-preview.nvim',
		event = 'BufEnter',
		build = 'cd app && yarn install',
	},

	-- :Twilight mode for better focus of active code blocks
	{
		'folke/twilight.nvim',
		event = 'BufEnter',
		opts = {
			hooks = {
				post = function()
					require('twilight').setup({})
				end
			}
		}
	},

	-- VimWiki
	{
		'vimwiki/vimwiki',
		event = 'BufEnter',
	},
}
