require('plugins/interface')
require('plugins/languages')
require('plugins/lsp')

-- Start packer, and include all plugins
require('packer').startup(function(use)
  -- Packer is able to manage itself
  use 'wbthomason/packer.nvim'

  interface(use)
  languages(use)
  lsp(use)
end)
