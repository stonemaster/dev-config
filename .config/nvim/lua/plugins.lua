return {
	{
		'ilyachur/cmake4vim',
		event = 'BufEnter',
	},
	{
		'OmniSharp/omnisharp-vim',
		event = 'BufEnter',
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
	{ import = 'rafi.plugins.extras.lsp.inlayhints' },

	-- YAML companion
	{ import = 'rafi.plugins.extras.lsp.yaml-companion' },

	-- Goto Preview
	{ import = 'rafi.plugins.extras.ui.goto-preview' },

	-- Sandwich plugin
	{ import = 'rafi.plugins.extras.coding.sandwich' },

	-- Autopairs
	{ import = 'rafi.plugins.extras.coding.autopairs' },

	-- Editorconfig
	{ import = 'rafi.plugins.extras.coding.editorconfig' },

	-- UFO (fold)
	{ import = 'rafi.plugins.extras.editor.ufo' },

	-- Sidebar
	{ import = 'rafi.plugins.extras.editor.sidebar' },

	-- Treesj
	{ import = 'rafi.plugins.extras.treesitter.treesj' },

	-- Cursorword
	{ import = 'rafi.plugins.extras.ui.cursorword' },

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
		cmd = { 'VimwikiIndex', 'VimwikiUISelect' },
		keys = {
			{ '<Leader>W', '<cmd>VimwikiIndex<CR>', { noremap = true } },
		},
		init = function()
			vim.g.vimwiki_global_ext = 0
			vim.g.vimwiki_use_calendar = 1
			vim.g.vimwiki_hl_headers = 1
			vim.g.vimwiki_hl_cb_checked = 1
			vim.g.vimwiki_autowriteall = 0
			vim.g.vimwiki_list = {
				{
					auto_toc = 1,
					path = '~/Documents/vimwiki',
					syntax = 'markdown',
					ext = '.md',
				},
			}
		end,
		config = function()
			vim.g.vimwiki_key_mappings = {
				all_maps = 1,
				global = 1,
				headers = 1,
				text_objs = 1,
				table_format = 1,
				table_mappings = 1,
				lists = 1,
				links = 1,
				html = 1,
				mouse = 0,
			}
		end,
	},

	-- Sync system clipboards
	{
		'EtiamNullam/deferred-clipboard.nvim',
		event = 'BufEnter',
		opts = {
			hooks = function()
				require('deferred-clipboard').setup {
				fallback = 'unnamedplus', -- or your preferred setting for clipboard
				}
			end
		}
	},

	-- Flutter
	{
		'akinsho/flutter-tools.nvim',
		event = 'BufEnter',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'stevearc/dressing.nvim', -- optional for vim.ui.select
		},
		opts = {
			hooks = function()
				require("flutter-tools").setup {}
				require("telescope").load_extension("flutter")
			end
		}
	},
}
