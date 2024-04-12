-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }
--
--
-- -- Set up custom autocommands
-- The below will set the background color to black on VimEnter event for the active buffer
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  command = "highlight Normal ctermbg=0 guibg=#000000",
})
