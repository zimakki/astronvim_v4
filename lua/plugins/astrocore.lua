-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = false, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      n = {
        -- mappings seen under group name "Buffer"
        ["<leader>b"] = { name = "Buffers" },
        ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "NNNNNew tab" },
        -- 🔭 Telescope
        ["<leader>bb"] = { ":Telescope buffers<cr>", desc = "🔭 Buffers" },
        ["<leader>ss"] = { ":Telescope current_buffer_fuzzy_find<cr>", desc = "🔭 Search Buffer" },
        ["<leader>sh"] = { ":Telescope resume<cr>", desc = "🔭 Telescope History" },
        ["<leader>st"] = { ":TodoTelescope<cr>", desc = "🔭 Telescope todo's" },
        ["<leader>sc"] = { ":Telescope command_history<CR>", desc = "🔭 Telescope command_history" },

        ["H"] = { ":bp<cr>", desc = "<<< buffer" },
        ["L"] = { ":bn<cr>", desc = ">>> buffer" },

        -- 🧪 testing
        ["<leader>tt"] = { ":wa<cr>:Neotest run<cr>", desc = "🧪 run tests" },
        ["<leader>tT"] = { ":Neotest summary<cr>", desc = "🧪 open tests summary" },
        ["<leader>tr"] = { ":wa<cr>:Neotest run last<cr>", desc = "🧪 rerun last test" },
        ["<leader>to"] = { ":Neotest output<cr>", desc = "🧪 open test output" },
        ["<leader>tp"] = { ":Neotest output-panel<cr>", desc = "🧪 open test panel" },
        ["<leader>td"] = { ":wa<cr>:TestNearest<cr>", desc = "🧪 🐞 debug nearest test" },

        ["<C-e>"] = { "$", desc = "got the end of the line" },
        ["<C-a>"] = { "0", desc = "got the start of the line" },
        ["yY"] = { "ggVG", desc = "select AAAALLLLLLLLLL" },
        ["<C-p>"] = { "@qn", desc = "🏃💨 rrruuuunnnn the macro and go to the next search term!!" },

        ["<leader>aa"] = { ":ChatGPT<cr>", desc = "🧠 💬 ChatGPT" },
        ["gj"] = { ":lua require('illuminate').goto_next_reference(wrap)<CR>", desc = "🏃💡 Illuminate Next" },
        ["gk"] = { ":lua require('illuminate').goto_prev_reference(wrap)<CR>", desc = "🏃💡 Illuminate Prev" },
        ["gf"] = { "gF", desc = "📁 Better gf! you want to go to the line number if it can find it" },
      },
      i = {
        ["<C-e>"] = { "<esc>A", desc = "▶ got the end of the line" },
        ["<C-a>"] = { "<esc>I", desc = "◀ got the start of the line" },
        ["<C-p>"] = { "|>", desc = "insert a |>" },
        ["<C-j>"] = { "<%=", desc = "insert a <%=" },
        ["<C-k>"] = { "%>", desc = "insert a %>" },
      },
      v = {
        ["<C-e>"] = { "$", desc = "▶ got the end of the line" },
        ["<C-a>"] = { "0", desc = "◀ got the start of the line" },
        ["<leader>ai"] = { ":ChatGPTEditWithInstructions<cr>", desc = "🧠 💬 ChatGPTEditWithInstructions" },
      },

      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
