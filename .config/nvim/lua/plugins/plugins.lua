return {
  -- Configure LazyVim to load catppuccino-frappe colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
    },
  },

  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    -- keys = {
    --   -- add a keymap to browse plugin files
    --   -- stylua: ignore
    --   {
    --     "<leader>fp",
    --     function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
    --     desc = "Find Plugin File",
    --   },
    -- },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.indent = { enable = false }
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "cpp",
        "d",
        "dart",
        "html",
        "javascript",
        "jq",
        "json",
        "kotlin",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "sql",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      })
    end,
  },

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "flake8",
        "ruff",
        "shellcheck",
        "shfmt",
        "stylua",
      },
    },
  },

  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },

  -- Neogit
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = true,
  },

  -- TMUX Navigation
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      -- { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  -- Flutter
  {
    "akinsho/flutter-tools.nvim",
    event = "BufEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    opts = {
      hooks = function()
        require("flutter-tools").setup({
          -- dev_log = {
          -- 	enabled = true,
          -- 	notify_errors = true,
          -- 	open_cmd = "tabnew",
          -- },
        })
        require("telescope").load_extension("flutter")
      end,
    },
  },

  -- Telekasten
  {
    "renerocksai/telekasten.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telekasten").setup({
        home = vim.fn.expand("~/Documents/wiki"),
        auto_set_syntax = false,
        auto_set_filetype = false,
        template_new_note = vim.fn.expand("~/.config/nvim/telekasten-new-note-template.md"),
      })
    end,
    keys = {
      { "<leader>zf", "<cmd>Telekasten find_notes<CR>" },
      { "<leader>zg", "<cmd>Telekasten search_notes<CR>" },
      { "<leader>zd", "<cmd>Telekasten goto_today<CR>" },
      { "<leader>zz", "<cmd>Telekasten follow_link<CR>" },
      { "<leader>zn", "<cmd>Telekasten new_note<CR>" },
      { "<leader>zc", "<cmd>Telekasten show_calendar<CR>" },
      { "<leader>zb", "<cmd>Telekasten show_backlinks<CR>" },
      { "<leader>zI", "<cmd>Telekasten insert_img_link<CR>" },

      -- Call insert link automatically when we start typing a link
      { "[[", "<cmd>Telekasten insert_link<CR>", "i" },
    },
  },

  -- CSV support
  {
    "cameron-wags/rainbow_csv.nvim",
    config = true,
    ft = {
      "csv",
      "tsv",
      "csv_semicolon",
      "csv_whitespace",
      "csv_pipe",
      "rfc_csv",
      "rfc_semicolon",
    },
    cmd = {
      "RainbowDelim",
      "RainbowDelimSimple",
      "RainbowDelimQuoted",
      "RainbowMultiDelim",
    },
  },

  -----------------------------------------------------------------------------
  -- Interacting with and manipulating marks
  {
    "chentoast/marks.nvim",
    event = "FileType",
    keys = {
      { "m/", "<cmd>MarksListAll<CR>", desc = "Marks from all opened buffers" },
    },
    opts = {
      sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
      bookmark_1 = { sign = "󰈼" }, -- ⚐ ⚑ 󰈻 󰈼 󰈽 󰈾 󰈿 󰉀
      mappings = {
        annotate = "m<Space>",
      },
    },
  },

  -- AnyJump, finding reference using <leader>ii
  {
    "pechorin/any-jump.vim",
    cmd = { "AnyJump", "AnyJumpVisual" },
    keys = {
      { "<leader>ii", "<cmd>AnyJump<CR>", desc = "Any Jump" },
      { "<leader>ii", "<cmd>AnyJumpVisual<CR>", mode = "x", desc = "Any Jump" },
      { "<leader>ib", "<cmd>AnyJumpBack<CR>", desc = "Any Jump Back" },
      { "<leader>il", "<cmd>AnyJumpLastResults<CR>", desc = "Any Jump Resume" },
    },
    init = function()
      vim.g.any_jump_disable_default_keybindings = 1
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("rafi_any-jump", {}),
        pattern = "any-jump",
        callback = function()
          vim.opt.cursorline = true
        end,
      })
    end,
  },

  -- Highlight colors in hex
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function()
      require("colorizer").setup()
    end,
  },

  -- Pleasant Git commit messages
  {
    "rhysd/committia.vim",
    -- Taken from rafi/vim-config
    event = "BufReadPre COMMIT_EDITMSG",
    init = function()
      -- See: https://github.com/rhysd/committia.vim#variables
      vim.g.committia_min_window_width = 30
      vim.g.committia_edit_window_width = 75
    end,
    config = function()
      vim.g.committia_hooks = {
        edit_open = function()
          vim.cmd.resize(10)
          local opts = {
            buffer = vim.api.nvim_get_current_buf(),
            silent = true,
          }
          local function map(mode, lhs, rhs)
            vim.keymap.set(mode, lhs, rhs, opts)
          end
          map("n", "q", "<cmd>quit<CR>")
          map("i", "<C-d>", "<Plug>(committia-scroll-diff-down-half)")
          map("i", "<C-u>", "<Plug>(committia-scroll-diff-up-half)")
          map("i", "<C-f>", "<Plug>(committia-scroll-diff-down-page)")
          map("i", "<C-b>", "<Plug>(committia-scroll-diff-up-page)")
          map("i", "<C-j>", "<Plug>(committia-scroll-diff-down)")
          map("i", "<C-k>", "<Plug>(committia-scroll-diff-up)")
        end,
      }
    end,
  },

  -- Preview images inside NVIM
  {
    "vhyrro/luarocks.nvim",
    priority = 1001, -- this plugin needs to run before anything else
    opts = {
      rocks = { "magick" },
    },
  },

  {
    "3rd/image.nvim",
    dependencies = { "luarocks.nvim" },
    opts = {},
  },

  -- Lua
  {
    "folke/zen-mode.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      { "<leader>zm", "<cmd>ZenMode<CR>", desc = "Enable ZenMode" },
    },
  },

  -- Goto Preview
  {
    "rmagatti/goto-preview",
    event = "BufEnter",
    config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
    keys = {
      { "<leader>gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", mode = 'n', desc = "Goto preview definition" },
      { "<leader>gpc", "<cmd>lua require('goto-preview').close_all_win()<CR>", mode = 'n', desc = "Goto preview: close all windows" },
      { "<leader>gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", mode = 'n', desc = "Goto preview references" },
      --nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
      --nnoremap gpt <cmd>lua require('goto-preview').goto_preview_type_definition()<CR>
      --nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
      --nnoremap gpD <cmd>lua require('goto-preview').goto_preview_declaration()<CR>
    },
  },
}
