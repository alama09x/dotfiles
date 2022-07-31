function map(m, k, v)
  vim.api.nvim_set_keymap(m, k, v, { noremap = true, silent = true })
end

-- Save and quit
map('n', '<C-q>', ':x<CR>')

-- Toggle search higlighting
map('n', '<C-h>', ':set hlsearch!<CR>')
