local vim = vim
local Plug = vim.fn['plug#']

-- Set leader key
vim.g.mapleader = ","

-- Plugin manager (vim-plug)
vim.call('plug#begin')
  Plug('junegunn/fzf.vim')
  Plug('scrooloose/nerdtree')
  Plug('easymotion/vim-easymotion')
  Plug('vim-airline/vim-airline')
  Plug('sjl/badwolf')
  Plug('neovim/nvim-lspconfig')
  Plug('ziglang/zig.vim')
vim.call('plug#end')

-- Disable some warnings when running :checkhealth
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0

-- don't show parse errors in a separate window
vim.g.zig_fmt_parse_errors = 0
-- disable format-on-save from `ziglang/zig.vim`
vim.g.zig_fmt_autosave = 0

-- Basic settings
vim.opt.encoding = "utf-8"
vim.opt.swapfile = false
vim.opt.background = "dark"
vim.cmd("colorscheme badwolf")
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

vim.opt.showcmd = true
vim.opt.number = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.cursorline = true
vim.opt.wrap = false -- do not automatically wrap on load
vim.opt.formatoptions:remove("t") -- do not automatically wrap text when typing
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.wildmenu = true
vim.opt.lazyredraw = true
vim.opt.showmatch = true
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0
vim.opt.foldenable = true
vim.opt.foldlevelstart = 10
vim.opt.foldnestmax = 10
vim.opt.foldmethod = "indent" -- fold based on indent level
vim.opt.colorcolumn = "120"

-- NERDTree Keymaps
vim.api.nvim_set_keymap('n', '<Leader>t', ':GFiles<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>nf', ':NERDTreeFind<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>nt', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.g.NERDTreeShowHidden = 1

-- Folding
vim.api.nvim_set_keymap('n', '<space>', 'za', { noremap = true, silent = true })

-- Easymotion settings
vim.g.EasyMotion_do_mapping = 0
vim.g.EasyMotion_smartcase = 1
vim.api.nvim_set_keymap('n', '<Leader>s', '<Plug>(easymotion-s2)', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-S-N>', ':Files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-F>', ':Rg<CR>', { noremap = true, silent = true })

-- ZIG

-- Formatting with ZLS matches `zig fmt`.
-- The Zig FAQ answers some questions about `zig fmt`:
-- https://github.com/ziglang/zig/wiki/FAQ
vim.api.nvim_create_autocmd('BufWritePre',{
  pattern = {"*.zig", "*.zon"},
  callback = function(ev)
    vim.lsp.buf.format()
  end
})

require('lspconfig').zls.setup {
  -- Only map shortcuts when in lsp mode
  on_attach = function(client, bufnr)
    vim.api.nvim_set_keymap('n', '<C-r><C-r>', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-S-I>', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })
  end,

  -- Server-specific settings. See `:help lspconfig-setup`

  -- omit the following line if `zls` is in your PATH
  --cmd = { '/path/to/zls_executable' },
  -- There are two ways to set config options:
  --   - edit your `zls.json` that applies to any editor that uses ZLS
  --   - set in-editor config options with the `settings` field below.
  --
  -- Further information on how to configure ZLS:
  -- https://zigtools.org/zls/configure/
  settings = {
    zls = {
      -- Whether to enable build-on-save diagnostics
      --
      -- Further information about build-on save:
      -- https://zigtools.org/zls/guides/build-on-save/
      -- enable_build_on_save = true,

      -- omit the following line if `zig` is in your PATH
      --zig_exe_path = '/path/to/zig_executable'
    }
  }
}

