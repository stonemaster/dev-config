local prefix = "<Leader>a"
return {
  -- Set explicit models for Copilot
  {
    "zbirenbaum/copilot.lua",
    optional = true,
    opts = function(_, opts)
      -- opts.model = "claude-sonnet-4"
      opts.model = "gpt-5.2-codex"
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      model = "gpt-5.2-codex",
      window = {
        -- layout = "float", -- 'vertical', 'horizontal', 'float'
        width = 0.5, -- 50% of screen width
      },
      -- model = "gemini-3-pro-preview",
      sticky = "#buffer:listed",
      mappings = {
        show_diff = {
          full_diff = true,
        },
      },
    },
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      adapter = {
        name = "copilot",
        model = "gpt-5.2-codex",
      },
      -- NOTE: The log_level is in `opts.opts`
      opts = {
        log_level = "DEBUG", -- or "TRACE"
      },
    },
  },
}
