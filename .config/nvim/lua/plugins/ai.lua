local prefix = "<Leader>a"
return {
  -- Set explicit models for Copilot
  -- {
  --   "zbirenbaum/copilot.lua",
  --   optional = true,
  --   opts = function(_, opts)
  --     -- opts.model = "claude-sonnet-4"
  --     -- opts.model = "gpt-5.3-codex"
  --   end,
  -- },
  -- GitHub Copilot
  --
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      model = "gpt-5.3-codex",
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
        reset = {
          normal = "<C-n>",
          insert = "<C-n>",
        },
      },
      prompts = {
        AddImports = {
          prompt = "Add necessary imports to the current file.",
        },
      },
      providers = {
        llama = {
          get_url = function(opts)
            return "http://localhost:8001/v1/chat/completions"
          end,
          get_headers = function()
            return { ["Authorization"] = "Bearer " .. "" }
          end,
          get_models = function()
            return { { id = "llama", name = "Running locally on port 8001" } }
          end,
          prepare_input = require("CopilotChat.config.providers").copilot.prepare_input,
          prepare_output = require("CopilotChat.config.providers").copilot.prepare_output,
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
    lazy = false,
    -- Expand 'cc' into 'CodeCompanion' in the command line
    init = function()
      vim.cmd([[cab cc CodeCompanion]])
    end,
    keys = {
      { "<leader>ac", "<cmd>CodeCompanionChat Toggle<CR>", desc = "Code CodeCompanion Chat" },
      { "<leader>at", "<cmd>CodeCompanionActions<CR>", desc = "Code CodeCompanion Actions" },
      { "ga", "<cmd>CodeCompanionChat Add<CR>", mode = "v", desc = "Code CodeCompanion Actions" },
    },
    opts = {
      -- Github Copilot
      --
      adapter = {
        name = "copilot",
        model = "gpt-5.3-codex",
      },
    },
  },
}
