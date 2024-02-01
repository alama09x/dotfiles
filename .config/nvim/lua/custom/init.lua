local autocmd = vim.api.nvim_create_autocmd

local set_indentation = function(lang, ind)
  autocmd("Filetype", {
    pattern = lang,
    callback = function()
      local o = vim.o
      o.expandtab = true
      o.smartindent = true
      o.tabstop = ind
      o.shiftwidth = ind
    end
  })
end

set_indentation("c", 4)

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})
