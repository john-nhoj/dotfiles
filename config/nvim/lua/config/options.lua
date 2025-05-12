-- options.lua

-- Toggles line numbers
vim.opt.number = true
-- Toggles cursor line (shows a bottom line where the cursor is)
vim.opt.cursorline = true
-- Toggles relative line numbers
vim.opt.relativenumber = true
-- Controls default tab width (default: 8)
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.wrap = false

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Adds padding above and below the cursor
vim.opt.scrolloff = 8

-- Enable clipboard between neovim and system
vim.opt.clipboard:append("unnamedplus")

-- Enable support for .editorconfig
vim.g.editorconfig = true

