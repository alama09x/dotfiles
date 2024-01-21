local autocmd = vim.api.nvim_create_autocmd

local function set_indentation_ft(lang, spaces)
  autocmd("FileType", {
    pattern = lang,
    callback = function()
      vim.o.tabstop = spaces
      vim.o.softtabstop = spaces
      vim.o.shiftwidth = spaces
    end,
  })
end

-- ----------- ----- --
-- INDENTATION FIXES --
-- ----------- ----- --

-- C
set_indentation_ft("nasm", 4)

-- C
set_indentation_ft("c", 8)

-- Haskell
set_indentation_ft("haskell", 4)

-- Svelte
set_indentation_ft("svelte", 2)

-- Typescript
set_indentation_ft("typescript", 2)

-- WGSL
set_indentation_ft("wgsl", 4)

-- ---- --
-- MISC --
-- ---- --

-- Erase background
autocmd("VimEnter", {
  pattern = "*",
  command = "hi Normal guibg=NONE ctermbg=NONE",
})

-- Bold line numbers
vim.opt.cursorline = true
autocmd("VimEnter", {
  pattern = "*",
  command = "hi CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE",
})

-- Initialize with proper size; fix bug
autocmd("VimEnter", {
  pattern = "*",
  command = ":sleep 20m",
})

autocmd("VimEnter", {
  pattern = "*",
  command = [[:silent exec "!kill -s SIGWINCH $PPID"]]
})

-- Proper C header file recognition
-- autocmd({"BufRead", "BufNewFile"}, {
--   pattern = "*.h",
--   command = "setfiletype c",
-- })

-- Proper NASM file recognition
autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.asm",
  command = "setfiletype nasm",
})
