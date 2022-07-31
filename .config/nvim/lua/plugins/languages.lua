function languages(use)
  -- Elixir
  use 'elixir-editors/vim-elixir'

  -- SQL
  use 'nanotee/sqls.nvim'

  -- Rust
  use 'rust-lang/rust.vim'

  -- TOML
  use 'cespare/vim-toml'

  -- Lua
  use 'tbastos/vim-lua'

  -- HTML
  use 'othree/html5.vim'

  -- JavaScript
  use 'pangloss/vim-javascript'

  -- Svelte
  use {'evanleck/vim-svelte',
    config = function()
      -- Enable Typescript syntax highlighting in Svelte
      vim.g.svelte_preprocessors = {'typescript'}
    end,
  }

  -- Haskell
  use {'neovimhaskell/haskell-vim',
    config = function()
      -- Enable Haskell syntax highlighting features
      vim.g.haskell_enable_quantification   = 1
      vim.g.haskell_enable_recursivedo    = 1
      vim.g.haskell_enable_arrowsyntax    = 1
      vim.g.haskell_enable_pattern_synonyms = 1
      vim.g.haskell_enable_typeroles    = 1
      vim.g.haskell_enable_static_pointers  = 1
      vim.g.haskell_backpack        = 1

      -- Classic Haskell syntax highlighting
      vim.g.haskell_classic_highlighting = 1
    end,
  }

  -- -- Yesod (Haskell)
  -- use 'alx741/yesod.vim'

  -- -- Shakespearian Templating
  -- use {'pbrisbin/vim-syntax-shakespeare',
  --   config = function()
  --     vim.g.hamlet_highlight_trailing_space = 0
  --   end,
  -- }

  -- Treesitter Highlighting
  use {'nvim-treesitter/nvim-treesitter',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "cpp", "lua", "rust", "wgsl" },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  }
end
