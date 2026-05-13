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
      -- registries = {
      --   "file:~/dev/opensource/mason-registry",
      -- },
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

  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     codelens = {
  --       enabled = true,
  --     },
  --     kotlin_lsp = {
  --       enabled = false,
  --     },
  --   },
  -- },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_enable = {
        -- We use other plugins to enable those.
        exclude = {
          "dartls",
          -- "kotlin_lsp",
        },
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
        home = vim.env.WIKI_DIR,
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

  -- Highlight colors in hex
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function()
      require("colorizer").setup()
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

  -- Prettify Logs.
  {
    "fei6409/log-highlight.nvim",
    opts = {},
  },

  -- Linediff
  {
    "andrewradev/linediff.vim",
  },
}
