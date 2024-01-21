-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/anthonyl/.cache/nvim/packer_hererocks/2.1.1702233742/share/lua/5.1/?.lua;/home/anthonyl/.cache/nvim/packer_hererocks/2.1.1702233742/share/lua/5.1/?/init.lua;/home/anthonyl/.cache/nvim/packer_hererocks/2.1.1702233742/lib/luarocks/rocks-5.1/?.lua;/home/anthonyl/.cache/nvim/packer_hererocks/2.1.1702233742/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/anthonyl/.cache/nvim/packer_hererocks/2.1.1702233742/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/anthonyl/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/anthonyl/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/home/anthonyl/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/anthonyl/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/anthonyl/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/anthonyl/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n]\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\fonedark\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/anthonyl/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/anthonyl/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\nç\1\0\0\5\0\f\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\0\0'\2\b\0B\0\2\0029\0\2\0005\2\t\0006\3\n\0=\3\v\2B\0\2\1K\0\1\0\21ensure_installed\fservers\1\0\0\20mason-lspconfig\aui\1\0\0\nicons\1\0\0\1\0\3\24package_uninstalled\bâœ—\20package_pending\bâžœ\22package_installed\bâœ“\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/home/anthonyl/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvim]\0\2\4\0\4\0\0065\2\0\0009\3\2\0009\3\3\0038\3\3\2=\3\1\1L\1\2\0\tname\vsource\tmenu\1\0\4\nvsnip\bâ‹—\rnvim_lsp\aÎ»\vbuffer\aÎ©\tpath\tðŸ–«K\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0+\2\0\0005\3\3\0B\0\3\1K\0\1\0\1\0\1\14focusable\1\15open_float\15diagnostic\bvimí\n\1\0\n\0L\0“\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0026\1\3\0006\3\4\0B\1\2\4X\4\b€6\6\0\0'\b\5\0B\6\2\0028\6\5\0069\6\6\0065\b\a\0=\0\b\bB\6\2\1E\4\3\3R\4ö\1276\1\0\0'\3\5\0B\1\2\0029\1\t\0019\1\6\0015\3\v\0005\4\n\0=\4\f\3B\1\2\0016\1\0\0'\3\r\0B\1\2\0029\2\6\0015\4\17\0005\5\15\0003\6\14\0=\6\16\5=\5\18\0045\5\21\0009\6\19\0019\6\20\6B\6\1\2=\6\22\0059\6\19\0019\6\23\6B\6\1\2=\6\24\0059\6\19\0019\6\20\6B\6\1\2=\6\25\0059\6\19\0019\6\23\6B\6\1\2=\6\26\0059\6\19\0019\6\27\6)\büÿB\6\2\2=\6\28\0059\6\19\0019\6\27\6)\b\4\0B\6\2\2=\6\29\0059\6\19\0019\6\30\6B\6\1\2=\6\31\0059\6\19\0019\6 \6B\6\1\2=\6!\0059\6\19\0019\6\"\0065\b%\0009\t#\0019\t$\t=\t&\bB\6\2\2=\6'\5=\5\19\0044\5\b\0005\6(\0>\6\1\0055\6)\0>\6\2\0055\6*\0>\6\3\0055\6+\0>\6\4\0055\6,\0>\6\5\0055\6-\0>\6\6\0055\6.\0>\6\a\5=\5/\0045\0053\0009\0060\0019\0061\0069\0062\6B\6\1\2=\0064\0059\0060\0019\0061\0069\0062\6B\6\1\2=\0065\5=\0051\0045\0057\0005\0066\0=\0068\0053\0069\0=\6:\5=\5;\4B\2\2\0016\2<\0009\2=\0025\3?\0=\3>\0026\2<\0009\2=\0026\3<\0009\3=\0039\3@\0035\4A\0 \3\4\3=\3@\0026\2<\0009\2B\0029\2C\2'\4D\0)\5,\1B\2\3\0016\2<\0009\2=\2'\3F\0=\3E\0026\2<\0009\2B\0029\2G\2'\4H\0005\5I\0003\6J\0=\6K\5B\2\3\1K\0\1\0\rcallback\0\1\0\1\fpattern\6*\15CursorHold\24nvim_create_autocmd\byes\15signcolumn\15updatetime\20nvim_set_option\bapi\1\0\1\6c\2\14shortmess\1\3\0\0\rnoselect\rnoinsert\16completeopt\bopt\bvim\15formatting\vformat\0\vfields\1\0\0\1\4\0\0\tmenu\tabbr\tkind\18documentation\15completion\1\0\0\rbordered\vwindow\vconfig\fsources\1\0\1\tname\tcalc\1\0\2\tname\nvsnip\19keyword_length\3\2\1\0\2\tname\vbuffer\19keyword_length\3\2\1\0\2\tname\rnvim_lua\19keyword_length\3\2\1\0\1\tname\28nvim_lsp_signature_help\1\0\2\tname\rnvim_lsp\19keyword_length\3\3\1\0\1\tname\tpath\t<CR>\rbehavior\1\0\1\vselect\2\vInsert\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\f<C-S-f>\16scroll_docs\n<Tab>\f<S-Tab>\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\bcmp\14filetypes\1\0\0\1\4\0\0\basm\tnasm\nvmasm\fasm_lsp\17capabilities\1\0\0\nsetup\14lspconfig\fSERVERS\vipairs\25default_capabilities\17cmp_nvim_lsp\frequire\0" },
    loaded = true,
    path = "/home/anthonyl/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\na\0\0\a\1\5\0\n-\0\0\0009\0\0\0,\2\3\0006\4\1\0009\4\2\0049\4\3\4'\6\4\0B\4\2\0A\0\2\1K\0\1\0\0À\24Log point message: \ninput\afn\bvim\19set_breakpoint7\0\0\3\1\2\0\6-\0\0\0009\0\0\0-\2\0\0009\2\1\2B\0\2\1K\0\1\0\1À\vframes\19centered_float7\0\0\3\1\2\0\6-\0\0\0009\0\0\0-\2\0\0009\2\1\2B\0\2\1K\0\1\0\1À\vscopes\19centered_floatg\0\0\5\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\2\3\0006\3\0\0009\3\1\0039\3\4\3B\3\1\2'\4\5\0&\3\4\3'\4\6\0D\0\4\0\tfile\6/\vgetcwd\25Path to executable: \ninput\afn\bvim“\a\1\0\a\0000\0t6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\a\0009\6\b\0B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\t\0009\6\n\0B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\v\0009\6\f\0B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\r\0009\6\14\0B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\15\0009\6\16\0B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\17\0009\6\18\0B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\19\0003\6\20\0B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\21\0009\6\22\0009\6\23\6B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\24\0009\6\25\0B\2\4\0016\2\3\0009\2\4\0029\2\5\0025\4\26\0'\5\27\0009\6\28\1B\2\4\0016\2\3\0009\2\4\0029\2\5\0025\4\29\0'\5\30\0009\6\31\1B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5 \0003\6!\0B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\"\0003\6#\0B\2\4\0019\2$\0005\3&\0005\4'\0=\4(\3=\3%\0024\2\3\0005\3)\0003\4*\0=\4+\3>\3\1\0029\3,\0=\2-\0039\3,\0=\2.\0039\3,\0=\2/\0032\0\0€K\0\1\0\bcpp\6c\trust\19configurations\fprogram\0\1\0\4\bcwd\23${workspaceFolder}\frequest\vlaunch\tname\vLaunch\ttype\bgdb\targs\1\3\0\0\a-i\bdap\1\0\2\ttype\15executable\fcommand\bgdb\bgdb\radapters\0\15<Leader>ds\0\15<Leader>df\fpreview\15<Leader>dp\1\3\0\0\6n\6v\nhover\15<Leader>dh\1\3\0\0\6n\6v\rrun_last\15<Leader>dl\topen\trepl\15<Leader>dr\0\15<Leader>lp\19set_breakpoint\14<Leader>B\22toggle_breakpoint\14<Leader>b\rstep_out\n<F12>\14step_into\n<F11>\14step_over\n<F10>\rcontinue\t<F5>\6n\bset\vkeymap\bvim\19dap.ui.widgets\bdap\frequire\0" },
    loaded = true,
    path = "/home/anthonyl/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\na\0\1\6\0\a\0\v6\1\0\0009\1\1\0019\1\2\0019\3\3\0005\4\4\0009\5\3\0=\5\5\0049\5\6\0=\5\6\4B\1\3\1K\0\1\0\ttext\vtexthl\1\0\1\nnumhl\5\tname\16sign_define\afn\bvimd\0\0\6\0\6\0\v6\0\0\0006\2\1\0009\2\2\0026\4\1\0009\4\3\0049\4\4\0049\4\5\4B\4\1\0A\2\0\0A\0\0\1K\0\1\0\27list_workspace_folders\bbuf\blsp\finspect\bvim\nprint@\0\0\3\0\5\0\a6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0B\0\2\1K\0\1\0\1\0\1\nasync\2\vformat\bbuf\blsp\bvim’\a\1\1\b\0&\0“\0016\1\0\0009\1\1\0019\2\2\0008\1\2\1'\2\4\0=\2\3\0015\1\5\0009\2\2\0=\2\6\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\n\0006\6\0\0009\6\v\0069\6\2\0069\6\f\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\r\0006\6\0\0009\6\v\0069\6\2\0069\6\14\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\15\0006\6\0\0009\6\v\0069\6\2\0069\6\16\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\17\0006\6\0\0009\6\v\0069\6\2\0069\6\18\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\19\0006\6\0\0009\6\v\0069\6\2\0069\6\20\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\21\0006\6\0\0009\6\v\0069\6\2\0069\6\22\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\23\0006\6\0\0009\6\v\0069\6\2\0069\6\24\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\25\0003\6\26\0\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\27\0006\6\0\0009\6\v\0069\6\2\0069\6\28\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\29\0006\6\0\0009\6\v\0069\6\2\0069\6\30\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\0025\4\31\0'\5 \0006\6\0\0009\6\v\0069\6\2\0069\6!\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\"\0006\6\0\0009\6\v\0069\6\2\0069\6#\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5$\0003\6%\0\18\a\1\0B\2\5\1K\0\1\0\0\r<space>f\15references\agr\16code_action\14<space>ca\1\3\0\0\6n\6v\vrename\14<space>rn\20type_definition\r<space>D\0\14<space>wl\28remove_workspace_folder\14<space>wr\25add_workspace_folder\14<space>wa\19signature_help\n<C-k>\19implementation\agi\nhover\6K\15definition\agd\16declaration\blsp\agD\6n\bset\vkeymap\vbuffer\1\0\0\27v:lua.vim.lsp.omnifunc\romnifunc\bbuf\abo\bvimÒ\4\1\0\t\0\27\0A3\0\0\0\18\1\0\0005\3\1\0B\1\2\1\18\1\0\0005\3\2\0B\1\2\1\18\1\0\0005\3\3\0B\1\2\1\18\1\0\0005\3\4\0B\1\2\0016\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\t\0006\5\5\0009\5\n\0059\5\v\5B\1\4\0016\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\f\0006\5\5\0009\5\n\0059\5\r\5B\1\4\0016\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\14\0006\5\5\0009\5\n\0059\5\15\5B\1\4\0016\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\16\0006\5\5\0009\5\n\0059\5\17\5B\1\4\0016\1\5\0009\1\18\0019\1\19\1'\3\20\0005\4\23\0006\5\5\0009\5\18\0059\5\21\5'\a\22\0004\b\0\0B\5\3\2=\5\24\0043\5\25\0=\5\26\4B\1\3\1K\0\1\0\rcallback\0\ngroup\1\0\0\18UserLspConfig\24nvim_create_augroup\14LspAttach\24nvim_create_autocmd\bapi\15setloclist\r<space>q\14goto_next\a]d\14goto_prev\a[d\15open_float\15diagnostic\r<space>e\6n\bset\vkeymap\bvim\1\0\2\tname\23DiagnosticSignInfo\ttext\bï‘‰\1\0\2\tname\23DiagnosticSignHint\ttext\bï µ\1\0\2\tname\23DiagnosticSignWarn\ttext\bï”©\1\0\2\tname\24DiagnosticSignError\ttext\bï™™\0\0" },
    loaded = true,
    path = "/home/anthonyl/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n™\3\0\0\6\0\19\0&6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0)\1\1\0=\1\5\0006\0\3\0009\0\4\0)\1\1\0=\1\6\0006\0\3\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\3\0009\0\a\0009\0\b\0'\2\t\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\3\0009\0\a\0009\0\b\0'\2\t\0'\3\16\0'\4\17\0005\5\18\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\25:NvimTreeFindFile<CR\14<leader>n\1\0\2\fnoremap\2\vsilent\2\25:NvimTreeRefresh<CR>\14<leader>r\1\0\2\fnoremap\2\vsilent\2\24:NvimTreeToggle<CR>\n<C-n>\6n\20nvim_set_keymap\bapi%nvim_tree_highlight_opened_files\21nvim_tree_git_hl\6g\bvim\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/anthonyl/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n½\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\1\0\3\21ensure_installed\ball\17auto_install\2\17sync_install\1\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/anthonyl/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/anthonyl/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["onedark.vim"] = {
    config = { "\27LJ\2\nS\0\0\3\0\5\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0'\2\4\0B\0\2\1K\0\1\0\18color onedark\bcmd\18termguicolors\bopt\bvim\0" },
    loaded = true,
    path = "/home/anthonyl/.local/share/nvim/site/pack/packer/start/onedark.vim",
    url = "https://github.com/joshdick/onedark.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/anthonyl/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/anthonyl/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n•\2\0\0\a\0\14\0$6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0009\5\a\0004\6\0\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\b\0009\5\t\0004\6\0\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\n\0009\5\v\0004\6\0\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\f\0009\5\r\0004\6\0\0B\1\5\1K\0\1\0\14help_tags\15<leader>fh\fbuffers\15<leader>fb\14live_grep\15<leader>fg\15find_files\15<leader>ff\6n\bset\vkeymap\bvim\22telescope.builtin\frequire\0" },
    loaded = true,
    path = "/home/anthonyl/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-smoothie"] = {
    loaded = true,
    path = "/home/anthonyl/.local/share/nvim/site/pack/packer/start/vim-smoothie",
    url = "https://github.com/psliwka/vim-smoothie"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/anthonyl/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: onedark.vim
time([[Config for onedark.vim]], true)
try_loadstring("\27LJ\2\nS\0\0\3\0\5\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0'\2\4\0B\0\2\1K\0\1\0\18color onedark\bcmd\18termguicolors\bopt\bvim\0", "config", "onedark.vim")
time([[Config for onedark.vim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\na\0\1\6\0\a\0\v6\1\0\0009\1\1\0019\1\2\0019\3\3\0005\4\4\0009\5\3\0=\5\5\0049\5\6\0=\5\6\4B\1\3\1K\0\1\0\ttext\vtexthl\1\0\1\nnumhl\5\tname\16sign_define\afn\bvimd\0\0\6\0\6\0\v6\0\0\0006\2\1\0009\2\2\0026\4\1\0009\4\3\0049\4\4\0049\4\5\4B\4\1\0A\2\0\0A\0\0\1K\0\1\0\27list_workspace_folders\bbuf\blsp\finspect\bvim\nprint@\0\0\3\0\5\0\a6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0B\0\2\1K\0\1\0\1\0\1\nasync\2\vformat\bbuf\blsp\bvim’\a\1\1\b\0&\0“\0016\1\0\0009\1\1\0019\2\2\0008\1\2\1'\2\4\0=\2\3\0015\1\5\0009\2\2\0=\2\6\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\n\0006\6\0\0009\6\v\0069\6\2\0069\6\f\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\r\0006\6\0\0009\6\v\0069\6\2\0069\6\14\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\15\0006\6\0\0009\6\v\0069\6\2\0069\6\16\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\17\0006\6\0\0009\6\v\0069\6\2\0069\6\18\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\19\0006\6\0\0009\6\v\0069\6\2\0069\6\20\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\21\0006\6\0\0009\6\v\0069\6\2\0069\6\22\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\23\0006\6\0\0009\6\v\0069\6\2\0069\6\24\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\25\0003\6\26\0\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\27\0006\6\0\0009\6\v\0069\6\2\0069\6\28\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\29\0006\6\0\0009\6\v\0069\6\2\0069\6\30\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\0025\4\31\0'\5 \0006\6\0\0009\6\v\0069\6\2\0069\6!\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\"\0006\6\0\0009\6\v\0069\6\2\0069\6#\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5$\0003\6%\0\18\a\1\0B\2\5\1K\0\1\0\0\r<space>f\15references\agr\16code_action\14<space>ca\1\3\0\0\6n\6v\vrename\14<space>rn\20type_definition\r<space>D\0\14<space>wl\28remove_workspace_folder\14<space>wr\25add_workspace_folder\14<space>wa\19signature_help\n<C-k>\19implementation\agi\nhover\6K\15definition\agd\16declaration\blsp\agD\6n\bset\vkeymap\vbuffer\1\0\0\27v:lua.vim.lsp.omnifunc\romnifunc\bbuf\abo\bvimÒ\4\1\0\t\0\27\0A3\0\0\0\18\1\0\0005\3\1\0B\1\2\1\18\1\0\0005\3\2\0B\1\2\1\18\1\0\0005\3\3\0B\1\2\1\18\1\0\0005\3\4\0B\1\2\0016\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\t\0006\5\5\0009\5\n\0059\5\v\5B\1\4\0016\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\f\0006\5\5\0009\5\n\0059\5\r\5B\1\4\0016\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\14\0006\5\5\0009\5\n\0059\5\15\5B\1\4\0016\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\16\0006\5\5\0009\5\n\0059\5\17\5B\1\4\0016\1\5\0009\1\18\0019\1\19\1'\3\20\0005\4\23\0006\5\5\0009\5\18\0059\5\21\5'\a\22\0004\b\0\0B\5\3\2=\5\24\0043\5\25\0=\5\26\4B\1\3\1K\0\1\0\rcallback\0\ngroup\1\0\0\18UserLspConfig\24nvim_create_augroup\14LspAttach\24nvim_create_autocmd\bapi\15setloclist\r<space>q\14goto_next\a]d\14goto_prev\a[d\15open_float\15diagnostic\r<space>e\6n\bset\vkeymap\bvim\1\0\2\tname\23DiagnosticSignInfo\ttext\bï‘‰\1\0\2\tname\23DiagnosticSignHint\ttext\bï µ\1\0\2\tname\23DiagnosticSignWarn\ttext\bï”©\1\0\2\tname\24DiagnosticSignError\ttext\bï™™\0\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n™\3\0\0\6\0\19\0&6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0)\1\1\0=\1\5\0006\0\3\0009\0\4\0)\1\1\0=\1\6\0006\0\3\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\3\0009\0\a\0009\0\b\0'\2\t\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\3\0009\0\a\0009\0\b\0'\2\t\0'\3\16\0'\4\17\0005\5\18\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\25:NvimTreeFindFile<CR\14<leader>n\1\0\2\fnoremap\2\vsilent\2\25:NvimTreeRefresh<CR>\14<leader>r\1\0\2\fnoremap\2\vsilent\2\24:NvimTreeToggle<CR>\n<C-n>\6n\20nvim_set_keymap\bapi%nvim_tree_highlight_opened_files\21nvim_tree_git_hl\6g\bvim\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n½\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\1\0\3\21ensure_installed\ball\17auto_install\2\17sync_install\1\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n•\2\0\0\a\0\14\0$6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0009\5\a\0004\6\0\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\b\0009\5\t\0004\6\0\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\n\0009\5\v\0004\6\0\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\f\0009\5\r\0004\6\0\0B\1\5\1K\0\1\0\14help_tags\15<leader>fh\fbuffers\15<leader>fb\14live_grep\15<leader>fg\15find_files\15<leader>ff\6n\bset\vkeymap\bvim\22telescope.builtin\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvim]\0\2\4\0\4\0\0065\2\0\0009\3\2\0009\3\3\0038\3\3\2=\3\1\1L\1\2\0\tname\vsource\tmenu\1\0\4\nvsnip\bâ‹—\rnvim_lsp\aÎ»\vbuffer\aÎ©\tpath\tðŸ–«K\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0+\2\0\0005\3\3\0B\0\3\1K\0\1\0\1\0\1\14focusable\1\15open_float\15diagnostic\bvimí\n\1\0\n\0L\0“\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0026\1\3\0006\3\4\0B\1\2\4X\4\b€6\6\0\0'\b\5\0B\6\2\0028\6\5\0069\6\6\0065\b\a\0=\0\b\bB\6\2\1E\4\3\3R\4ö\1276\1\0\0'\3\5\0B\1\2\0029\1\t\0019\1\6\0015\3\v\0005\4\n\0=\4\f\3B\1\2\0016\1\0\0'\3\r\0B\1\2\0029\2\6\0015\4\17\0005\5\15\0003\6\14\0=\6\16\5=\5\18\0045\5\21\0009\6\19\0019\6\20\6B\6\1\2=\6\22\0059\6\19\0019\6\23\6B\6\1\2=\6\24\0059\6\19\0019\6\20\6B\6\1\2=\6\25\0059\6\19\0019\6\23\6B\6\1\2=\6\26\0059\6\19\0019\6\27\6)\büÿB\6\2\2=\6\28\0059\6\19\0019\6\27\6)\b\4\0B\6\2\2=\6\29\0059\6\19\0019\6\30\6B\6\1\2=\6\31\0059\6\19\0019\6 \6B\6\1\2=\6!\0059\6\19\0019\6\"\0065\b%\0009\t#\0019\t$\t=\t&\bB\6\2\2=\6'\5=\5\19\0044\5\b\0005\6(\0>\6\1\0055\6)\0>\6\2\0055\6*\0>\6\3\0055\6+\0>\6\4\0055\6,\0>\6\5\0055\6-\0>\6\6\0055\6.\0>\6\a\5=\5/\0045\0053\0009\0060\0019\0061\0069\0062\6B\6\1\2=\0064\0059\0060\0019\0061\0069\0062\6B\6\1\2=\0065\5=\0051\0045\0057\0005\0066\0=\0068\0053\0069\0=\6:\5=\5;\4B\2\2\0016\2<\0009\2=\0025\3?\0=\3>\0026\2<\0009\2=\0026\3<\0009\3=\0039\3@\0035\4A\0 \3\4\3=\3@\0026\2<\0009\2B\0029\2C\2'\4D\0)\5,\1B\2\3\0016\2<\0009\2=\2'\3F\0=\3E\0026\2<\0009\2B\0029\2G\2'\4H\0005\5I\0003\6J\0=\6K\5B\2\3\1K\0\1\0\rcallback\0\1\0\1\fpattern\6*\15CursorHold\24nvim_create_autocmd\byes\15signcolumn\15updatetime\20nvim_set_option\bapi\1\0\1\6c\2\14shortmess\1\3\0\0\rnoselect\rnoinsert\16completeopt\bopt\bvim\15formatting\vformat\0\vfields\1\0\0\1\4\0\0\tmenu\tabbr\tkind\18documentation\15completion\1\0\0\rbordered\vwindow\vconfig\fsources\1\0\1\tname\tcalc\1\0\2\tname\nvsnip\19keyword_length\3\2\1\0\2\tname\vbuffer\19keyword_length\3\2\1\0\2\tname\rnvim_lua\19keyword_length\3\2\1\0\1\tname\28nvim_lsp_signature_help\1\0\2\tname\rnvim_lsp\19keyword_length\3\3\1\0\1\tname\tpath\t<CR>\rbehavior\1\0\1\vselect\2\vInsert\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\f<C-S-f>\16scroll_docs\n<Tab>\f<S-Tab>\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\bcmp\14filetypes\1\0\0\1\4\0\0\basm\tnasm\nvmasm\fasm_lsp\17capabilities\1\0\0\nsetup\14lspconfig\fSERVERS\vipairs\25default_capabilities\17cmp_nvim_lsp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\nç\1\0\0\5\0\f\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\0\0'\2\b\0B\0\2\0029\0\2\0005\2\t\0006\3\n\0=\3\v\2B\0\2\1K\0\1\0\21ensure_installed\fservers\1\0\0\20mason-lspconfig\aui\1\0\0\nicons\1\0\0\1\0\3\24package_uninstalled\bâœ—\20package_pending\bâžœ\22package_installed\bâœ“\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\na\0\0\a\1\5\0\n-\0\0\0009\0\0\0,\2\3\0006\4\1\0009\4\2\0049\4\3\4'\6\4\0B\4\2\0A\0\2\1K\0\1\0\0À\24Log point message: \ninput\afn\bvim\19set_breakpoint7\0\0\3\1\2\0\6-\0\0\0009\0\0\0-\2\0\0009\2\1\2B\0\2\1K\0\1\0\1À\vframes\19centered_float7\0\0\3\1\2\0\6-\0\0\0009\0\0\0-\2\0\0009\2\1\2B\0\2\1K\0\1\0\1À\vscopes\19centered_floatg\0\0\5\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\2\3\0006\3\0\0009\3\1\0039\3\4\3B\3\1\2'\4\5\0&\3\4\3'\4\6\0D\0\4\0\tfile\6/\vgetcwd\25Path to executable: \ninput\afn\bvim“\a\1\0\a\0000\0t6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\a\0009\6\b\0B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\t\0009\6\n\0B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\v\0009\6\f\0B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\r\0009\6\14\0B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\15\0009\6\16\0B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\17\0009\6\18\0B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\19\0003\6\20\0B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\21\0009\6\22\0009\6\23\6B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\24\0009\6\25\0B\2\4\0016\2\3\0009\2\4\0029\2\5\0025\4\26\0'\5\27\0009\6\28\1B\2\4\0016\2\3\0009\2\4\0029\2\5\0025\4\29\0'\5\30\0009\6\31\1B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5 \0003\6!\0B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\"\0003\6#\0B\2\4\0019\2$\0005\3&\0005\4'\0=\4(\3=\3%\0024\2\3\0005\3)\0003\4*\0=\4+\3>\3\1\0029\3,\0=\2-\0039\3,\0=\2.\0039\3,\0=\2/\0032\0\0€K\0\1\0\bcpp\6c\trust\19configurations\fprogram\0\1\0\4\bcwd\23${workspaceFolder}\frequest\vlaunch\tname\vLaunch\ttype\bgdb\targs\1\3\0\0\a-i\bdap\1\0\2\ttype\15executable\fcommand\bgdb\bgdb\radapters\0\15<Leader>ds\0\15<Leader>df\fpreview\15<Leader>dp\1\3\0\0\6n\6v\nhover\15<Leader>dh\1\3\0\0\6n\6v\rrun_last\15<Leader>dl\topen\trepl\15<Leader>dr\0\15<Leader>lp\19set_breakpoint\14<Leader>B\22toggle_breakpoint\14<Leader>b\rstep_out\n<F12>\14step_into\n<F11>\14step_over\n<F10>\rcontinue\t<F5>\6n\bset\vkeymap\bvim\19dap.ui.widgets\bdap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n]\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\fonedark\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
