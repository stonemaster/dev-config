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
		dependencies = {
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
		dependencies = 'nvim-treesitter',
		event = 'BufEnter',
		opts = {
			hooks = {
				post = function()
					require('iswap').setup {}
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
	-- { import = 'rafi.plugins.extras.lsp.inlayhints' },

	-- YAML companion
	{ import = 'rafi.plugins.extras.lsp.yaml-companion' },

	-- Prettier
	{ import = 'lazyvim.plugins.extras.formatting.prettier' },

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

	-- Anyjump
	{ import = 'rafi.plugins.extras.editor.anyjump' },

	-- Treesj
	{ import = 'rafi.plugins.extras.treesitter.treesj' },

	-- Cursorword
	{ import = 'rafi.plugins.extras.ui.cursorword' },

	-- Zk
	{ import = 'rafi.plugins.extras.org.zk' },

	-- Languages
	{ import = 'rafi.plugins.extras.lang.python' },
	{ import = 'rafi.plugins.extras.lang.yaml' },
	{ import = 'lazyvim.plugins.extras.lang.json' },
	{ import = 'rafi.plugins.extras.lang.docker' },
	{ import = 'rafi.plugins.extras.lang.ansible' },

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
				require("flutter-tools").setup {
					-- dev_log = {
					-- 	enabled = true,
					-- 	notify_errors = true,
					-- 	open_cmd = "tabnew",
					-- },
				}
				require("telescope").load_extension("flutter")
			end
		}
	},

	-- :SortImports
	-- { 'stonemaster/import-sort.nvim',
	--  	event = 'BufEnter',
	-- 	config = function ()
	-- 		require('import-sort')
	-- 	end
	-- }

	{
		dir = vim.env.HOME .. '/dev/opensource/import-sort.nvim',
		name = 'import-sort',
		event = 'BufEnter',
		config = function()
			require('import-sort')
		end
	},

	-- Enable GitHub's Copilot
	-- TODO: apparently doesn't work!?
	-- { import = 'rafi.plugins.extras.coding.copilot' },

	-- GitHub Copilot (adapted from Rafi)
	{
		'zbirenbaum/copilot.lua',
		cmd = 'Copilot',
		event = 'InsertEnter',
		config = function()
			require("copilot").setup({
				suggestion = {
					auto_trigger = true,
				}
			})
		end
	},
	{
		'zbirenbaum/copilot-cmp',
		dependencies = 'zbirenbaum/copilot.lua',
		opts = {},
		config = function(_, opts)
			local copilot_cmp = require('copilot_cmp')
			copilot_cmp.setup(opts)
			-- attach cmp source whenever copilot attaches
			-- fixes lazy-loading issues with the copilot cmp source
			---@param client lsp.Client
			require('rafi.lib.utils').on_attach(function(client)
				if client.name == 'copilot' then
					copilot_cmp._on_insert_enter({})
				end
			end)
		end,
	},

	-- GitHub Copilot Chat
	-- https://github.com/CopilotC-Nvim/CopilotChat.nvim
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		opts = {
			show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
			debug = false,    -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
			disable_extra_info = 'no', -- Disable extra information (e.g: system prompt) in the response.
			language =
			"English"         -- Copilot answer language settings when using default prompts. Default language is English.
		},
		dependencies = {
			{ "nvim-telescope/telescope.nvim" }, -- Use telescope for help actions
			{ "nvim-lua/plenary.nvim" },
		},
		build = function()
			vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
		end,
		event = "VeryLazy",
		keys = {
			{ "<leader>ccb", ":CopilotChatBuffer ",         desc = "CopilotChat - Chat with current buffer" },
			{ "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
			{ "<leader>cct", "<cmd>CopilotChatTests<cr>",   desc = "CopilotChat - Generate tests" },
			{
				"<leader>ccT",
				"<cmd>CopilotChatVsplitToggle<cr>",
				desc = "CopilotChat - Toggle Vsplit", -- Toggle vertical split
			},
			{
				"<leader>ccv",
				":CopilotChatVisual ",
				mode = "x",
				desc = "CopilotChat - Open in vertical split",
			},
			{
				"<leader>ccx",
				":CopilotChatInPlace<cr>",
				mode = "x",
				desc = "CopilotChat - Run in-place code",
			},
			{
				"<leader>ccf",
				"<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
				desc = "CopilotChat - Fix diagnostic",
			},
			{
				"<leader>ccr",
				"<cmd>CopilotChatReset<cr>", -- Reset chat history and clear buffer.
				desc = "CopilotChat - Reset chat history and clear buffer",
			},
			{
				"<leader>cch",
				function()
					require("CopilotChat.code_actions").show_help_actions()
				end,
				desc = "CopilotChat - Help actions",
			},
			-- Show prompts actions with telescope
			{
				"<leader>ccp",
				function()
					require("CopilotChat.code_actions").show_prompt_actions()
				end,
				desc = "CopilotChat - Help actions",
			},
			{
				"<leader>ccp",
				":lua require('CopilotChat.code_actions').show_prompt_actions(true)<CR>",
				mode = "x",
				desc = "CopilotChat - Prompt actions",
			},
		},
	},
}
