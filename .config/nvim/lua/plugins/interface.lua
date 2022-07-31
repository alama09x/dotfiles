function interface(use)
  -- Faster filetype.vim
  use 'nathom/filetype.nvim'

  -- Informative status bar and themes
  use {'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        options = { theme = 'onedark' },
      }
    end
  }

  -- Color scheme
  use {'joshdick/onedark.vim',
    config = function()
      -- Use true colors
      vim.opt.termguicolors = true

      -- Set colorscheme
      vim.cmd[[color onedark]]
    end,
  }

  use 'Yggdroot/indentLine'

  -- Smooth scrolling
  use 'psliwka/vim-smoothie'

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup {}

      vim.g.nvim_tree_git_hl = 1
      vim.g.nvim_tree_highlight_opened_files = 1

      vim.api.nvim_set_keymap(
      'n', '<C-n>', ':NvimTreeToggle<CR>',
      { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
      'n', '<leader>r', ':NvimTreeRefresh<CR>',
      { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
      'n', '<leader>n', ':NvimTreeFindFile<CR',
      { noremap = true, silent = true }
      )
    end
  }

end
