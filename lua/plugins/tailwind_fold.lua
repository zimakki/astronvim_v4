return {
  -- tailwind-tools.lua
  "luckasRanarison/tailwind-tools.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    conceal = {
      enabled = true,
    },
  }, -- your configuration
}

--
-- this plugin is not working with heex files....
--
-- return {
--   "razak17/tailwind-fold.nvim",
--   opts = {},
--   dependencies = { "nvim-treesitter/nvim-treesitter" },
--   ft = {
--     "astro",
--     "blade",
--     "eex",
--     "elixir",
--     "heex",
--     "html",
--     "html-eex",
--     "phoenix-heex",
--     "php",
--     "surface",
--     "svelte",
--     "typescriptreact",
--     "vue",
--   },
-- }
