SERVERS = { 'asm_lsp', 'clangd', 'hls', 'lua_ls', 'rust_analyzer', 'tsserver', }
-- Start packer, and include all plugins
require('packer').startup(function(use)
  -- Packer is able to manage itself
  use 'wbthomason/packer.nvim'

  -- LSPs
  use { 'neovim/nvim-lspconfig',
    config = function()
      -- Diagnostic symbols
      local sign = function(opts)
        vim.fn.sign_define(opts.name, {
          texthl = opts.name,
          text = opts.text,
          numhl = ''
        })
      end

      sign({ name = 'DiagnosticSignError', text = '' })
      sign({ name = 'DiagnosticSignWarn', text = '' })
      sign({ name = 'DiagnosticSignHint', text = '' })
      sign({ name = 'DiagnosticSignInfo', text = '' })

      -- Global mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })
    end,
  }

  -- Completion
  use { 'hrsh7th/nvim-cmp',
    requires = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
    },
    config = function()
      -- Add additional capabilities supported by nvim-cmp
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
      for _, lsp in ipairs(SERVERS) do
        require('lspconfig')[lsp].setup {
          -- on_attach = my_custom_on_attach,
          capabilities = capabilities,
        }
      end
      require('lspconfig').asm_lsp.setup {
        filetypes = { "asm", "nasm", "vmasm" },
      }

      -- Completion Plugin Setup
      local cmp = require 'cmp'
      cmp.setup({
        -- Enable LSP snippets
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = {
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Add tab support
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          })
        },
        -- Installed sources:
        sources = {
          { name = 'path' },                         -- file paths
          { name = 'nvim_lsp',               keyword_length = 3 }, -- from language server
          { name = 'nvim_lsp_signature_help' },      -- display function signatures with current parameter emphasized
          { name = 'nvim_lua',               keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
          { name = 'buffer',                 keyword_length = 2 }, -- source current buffer
          { name = 'vsnip',                  keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
          { name = 'calc' },                         -- source for math calculation
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          fields = { 'menu', 'abbr', 'kind' },
          format = function(entry, item)
            local menu_icon = {
              nvim_lsp = 'λ',
              vsnip = '⋗',
              buffer = 'Ω',
              path = '🖫',
            }
            item.menu = menu_icon[entry.source.name]
            return item
          end,
        },
      })
      -- Set completeopt to have a better completion experience
      -- :help completeopt
      -- menuone: popup even when there's only one match
      -- noinsert: Do not insert text until a selection is made
      -- noselect: Do not select, force to select one from the menu
      -- shortness: avoid showing extra messages when using completion
      -- updatetime: set updatetime for CursorHold
      vim.opt.completeopt = { 'noselect', 'noinsert' }
      vim.opt.shortmess = vim.opt.shortmess + { c = true }
      vim.api.nvim_set_option('updatetime', 300)

      -- Fixed column for diagnostics to appear
      -- Show autodiagnostic popup on cursor hover_range
      -- Goto previous / next diagnostic warning / error
      -- Show inlay_hints more frequently
      vim.opt.signcolumn = 'yes'
      vim.api.nvim_create_autocmd('CursorHold', {
        pattern = '*',
        callback = function()
          vim.diagnostic.open_float(nil, { focusable = false })
        end,
      })
    end,
  }

  -- Debugger
  use { 'mfussenegger/nvim-dap',
    config = function()
      local dap = require('dap')
      local widgets = require('dap.ui.widgets')

      -- Key mappings
      vim.keymap.set('n', '<F5>', dap.continue)
      vim.keymap.set('n', '<F10>', dap.step_over)
      vim.keymap.set('n', '<F11>', dap.step_into)
      vim.keymap.set('n', '<F12>', dap.step_out)
      vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint)
      vim.keymap.set('n', '<Leader>B', dap.set_breakpoint)
      vim.keymap.set('n', '<Leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
      vim.keymap.set('n', '<Leader>dr', dap.repl.open)
      vim.keymap.set('n', '<Leader>dl', dap.run_last)

      vim.keymap.set({ 'n', 'v' }, '<Leader>dh', widgets.hover)
      vim.keymap.set({ 'n', 'v' }, '<Leader>dp', widgets.preview)
      vim.keymap.set('n', '<Leader>df', function() widgets.centered_float(widgets.frames) end)
      vim.keymap.set('n', '<Leader>ds', function() widgets.centered_float(widgets.scopes) end)

      -- Adapters
      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "-i", "dap" }
      }

      -- Configurations
      local gdb_config = {
        {
          name = "Launch",
          type = "gdb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = "${workspaceFolder}",
        },
      }

      dap.configurations.rust = gdb_config
      dap.configurations.c = gdb_config
      dap.configurations.cpp = gdb_config
    end,
  }

  -- Mason - manage LSPs & more
  use { 'williamboman/mason.nvim',
    requires = { 'williamboman/mason-lspconfig.nvim' },
    config = function()
      require('mason').setup({
        ui = {
          icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
          },
        },
      })

      require('mason-lspconfig').setup({
        ensure_installed = servers
      })
    end,
  }

  -- Treesitter Highlighting
  use { 'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = 'all',
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end,
  }

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup()

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
    end,
  }

  use { 'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end,
  }

  -- Color scheme
  use { 'joshdick/onedark.vim',
    config = function()
      -- Use true colors
      vim.opt.termguicolors = true

      -- Set colorscheme
      vim.cmd [[color onedark]]
    end,
  }

  -- Informative status bar and themes
  use { 'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup({
        options = { theme = 'onedark' },
      })
    end,
  }

  -- Rust Tools
--   use { 'simrat39/rust-tools.nvim',
--     config = function()
--       require('rust-tools').setup()
--     end,
--   }

  -- Smooth scrolling
  use 'psliwka/vim-smoothie'
end)
