return {
  -- Kotlin support
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
  {
    "AlexandrosAlexiou/kotlin.nvim",
    ft = { "kotlin" },
    dependencies = { "mason.nvim", "mason-lspconfig.nvim", "oil.nvim" },
    config = function()
      require("kotlin").setup({
        -- Optional: Specify root markers for multi-module projects
        root_markers = {
          "gradlew",
          -- ".git",
          -- "mvnw",
          -- "settings.gradle",
        },
        -- Optional: Specify a custom Java path to run the server
        -- jre_path = os.getenv("JDK21"),
        -- Optional: Specify additional JVM arguments
        jvm_args = {
          "-Xmx4g",
        },
      })
    end,
  },
}
