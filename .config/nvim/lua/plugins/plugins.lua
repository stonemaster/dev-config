return {
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load catppuccino-frappe colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      -- catppuccin-frappe
      colorscheme = "gruvbox",
    },
  },

  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          files = { hidden = true },
        },
        hidden = true, -- for hidden files
        -- Fix error with value being nil
        show_delay = 0,
        -- ignored = true, -- for .gitignore files
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
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "flake8",
        "ruff",
        "shellcheck",
        "shfmt",
        "stylua",
        "ansible-language-server",
        "harper-ls",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      codelens = {
        enabled = true,
      },
      kotlin_lsp = {
        enabled = false,
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

  -- Neogit
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      -- Note: taken from https://github.com/NeogitOrg/neogit
      "ibhagwan/fzf-lua",
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
  -- {
  --   "hat0uma/csvview.nvim",
  --   opts = {
  --     parser = { comments = { "#", "//" } },
  --     keymaps = {
  --       -- Text objects for selecting fields
  --       textobject_field_inner = { "if", mode = { "o", "x" } },
  --       textobject_field_outer = { "af", mode = { "o", "x" } },
  --       -- Excel-like navigation:
  --       -- Use <Tab> and <S-Tab> to move horizontally between fields.
  --       -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
  --       -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
  --       jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
  --       jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
  --       jump_next_row = { "<Enter>", mode = { "n", "v" } },
  --       jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
  --     },
  --   },
  --   cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
  --   ft = {
  --     "csv",
  --     "tsv",
  --     "csv_semicolon",
  --     "csv_whitespace",
  --     "csv_pipe",
  --     "rfc_csv",
  --     "rfc_semicolon",
  --   },
  -- },

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

  -- Zen Mode
  {
    "folke/zen-mode.nvim",
    opts = {
      plugins = {
        -- kitty = {
        --   enabled = true,
        --   font = "+4", -- font size increment
        -- },
      },
    },
    keys = {
      { "<leader>zm", "<cmd>ZenMode<CR>", desc = "Enable ZenMode" },
    },
  },

  -- -- Twilight which is enabled in Zen mode
  -- {
  --   "folke/twilight.nvim",
  --   opts = {},
  -- },

  -- Goto Preview
  {
    "rmagatti/goto-preview",
    event = "BufEnter",
    config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
    keys = {
      {
        "<leader>cpd",
        "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
        mode = "n",
        desc = "Goto preview definition",
      },
      {
        "<leader>cpc",
        "<cmd>lua require('goto-preview').close_all_win()<CR>",
        mode = "n",
        desc = "Goto preview: close all windows",
      },
      {
        "<leader>cpr",
        "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
        mode = "n",
        desc = "Goto preview references",
      },
      --nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
      --nnoremap gpt <cmd>lua require('goto-preview').goto_preview_type_definition()<CR>
      --nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
      --nnoremap gpD <cmd>lua require('goto-preview').goto_preview_declaration()<CR>
    },
  },

  -- Import sort
  {
    "stonemaster/import-sort.nvim",
    event = "BufEnter",
    config = function()
      require("import-sort")
    end,
    keys = {
      { "<leader>ci", "<cmd>SortImports<CR>", desc = "Sort Imports" },
    },
  },

  -- Quickfix List improvements
  {
    "kevinhwang91/nvim-bqf",
  },
  {
    "itchyny/vim-qfedit",
  },

  -- Noice override: show :make
  -- commands in regular output window.
  {
    "folke/noice.nvim",
    opts = {
      messages = {
        enabled = false,
      },
    },
  },

  -- YAML+Jinja
  {
    "nextmn/vim-yaml-jinja",
  },

}
