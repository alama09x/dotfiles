local opt = vim.opt
local g = vim.g

-- Set indentation to n spaces
local n = 2
opt.tabstop   = n
opt.softtabstop = n
opt.shiftwidth  = n
opt.expandtab   = true

-- Set <Leader>
g.mapleader = ","

-- Always view n lines above and below while scrolling
opt.scrolloff = 1

-- Do not highlight while in search
opt.hlsearch = false

-- Show line numbers
opt.number = true

-- Hybrid line numbers
-- vim.opt_local.relativenumber = true

-- No word wrap, of which is quite confusing
opt.wrap = false

-- Ignore false bracket errors in C
g.c_no_curly_error = 1

-- Cursor possibilities
opt.mouse = 'a'

g.c_syntax_for_h = true
