return {
  -- tailwind-tools.lua
  "luckasRanarison/tailwind-tools.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    conceal = {
      enabled = true,
    },
  }, -- your configuration
  config = function()
    -- Call the original plugin setup
    require("tailwind-tools").setup()

    -- Optionally log that the config function is being called
    local function log_message(msg)
      local log_file = "/tmp/nvim-tailwind-tools.log"
      local f = io.open(log_file, "a")
      if f then
        f:write(msg .. "\n")
        f:close()
      end
    end
    log_message "Tailwind Tools config is loaded"

    -- Add the root_dir function for LSP
    require("lspconfig").tailwindcss.setup {
      init_options = {
        userLanguages = {
          elixir = "phoenix-heex",
          heex = "phoenix-heex",
        },
      },
      settings = {
        includeLanguages = {
          ["html-eex"] = "html",
          ["phoenix-heex"] = "html",
          heex = "html",
          eelixir = "html",
          elixir = "html",
        },
      },
      root_dir = function(fname)
        local lspconfig_util = require "lspconfig.util"

        -- Log function to track steps
        local function log_message(msg)
          local log_file = "/tmp/nvim-tailwind-tools.log"
          local f = io.open(log_file, "a")
          if f then
            f:write(msg .. "\n")
            f:close()
          end
        end

        log_message("Searching for root starting at: " .. fname)

        -- Find the project root based on .git or package.json (or other common project markers)
        local root_pattern = lspconfig_util.root_pattern(".git", "package.json")
        local root = root_pattern(fname)
        log_message("Git root found: " .. (root or "none"))

        -- If the project root is found, log and return the root
        if root then
          -- Ensure the Tailwind config exists in the wildflower/assets folder
          local tailwind_config_path = root .. "/wildflower/assets/tailwind.config.js"
          if vim.fn.filereadable(tailwind_config_path) == 1 then
            log_message("Tailwind config found at: " .. tailwind_config_path)
            return root -- Return the project root (not the assets directory)
          else
            log_message "Tailwind config not found in wildflower/assets"
          end
        end

        log_message "Fallback to the current working directory if no root found"
        return vim.fn.getcwd()
      end,
    }

    -- Log that the root_dir function has been set up
    log_message "TailwindCSS root_dir function configured"
  end,
}
