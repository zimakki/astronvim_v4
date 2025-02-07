return {
  "nvim-telescope/telescope-frecency.nvim",
  -- install the latest stable version
  version = "*",
  config = function()
    require("telescope").load_extension "frecency"
    require("telescope").setup {
      extensions = {
        ---@type FrecencyOpts
        frecency = {
          auto_validate = false,
          default_workspace = "CWD",
          -- …… other configs
        },
      },
    }
  end,
}
