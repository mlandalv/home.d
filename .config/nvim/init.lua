local vim = vim
local Plug = vim.fn['plug#']

-- Set leader key
vim.g.mapleader = ","

-- disable vim's build-in file explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- Plugin manager (vim-plug)
vim.call('plug#begin')
  Plug('nvim-tree/nvim-web-devicons')
  Plug('junegunn/fzf.vim')
  --Plug('scrooloose/nerdtree')
  --Plug('ryanoasis/vim-devicons') -- file type icons in nerdtree
  Plug('nvim-tree/nvim-tree.lua')
  Plug('easymotion/vim-easymotion')
  Plug('vim-airline/vim-airline')
  Plug('sjl/badwolf')
  Plug('neovim/nvim-lspconfig')
  Plug('ziglang/zig.vim')
  --Plug('romgrk/barbar.nvim')
  --Plug('nvim-tree/nvim-web-devicons') -- file icons barbar
  --Plug('nvim-treesitter/nvim-treesitter')
  --Plug('jreybert/vimagit')
  Plug('preservim/tagbar')
  Plug('tpope/vim-surround')
  Plug('nvimdev/dashboard-nvim')
vim.call('plug#end')

-- Disable some warnings when running :checkhealth
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0

-- don't show parse errors in a separate window
vim.g.zig_fmt_parse_errors = 0
-- disable format-on-save from `ziglang/zig.vim`
vim.g.zig_fmt_autosave = 0

-- Basic settings
vim.cmd("colorscheme badwolf")
vim.cmd("filetype plugin indent on")
--vim.cmd("syntax on")

-- Global options
vim.opt.encoding = "utf-8"
vim.opt.swapfile = false
vim.opt.background = "dark"
vim.opt.clipboard = 'unnamedplus'
vim.opt.termguicolors = true
vim.opt.breakindent = true
vim.opt.syntax = 'on'
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
--vim.opt.lazyredraw = true
vim.opt.showmatch = true
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0
vim.opt.foldenable = true
vim.opt.foldlevelstart = 10
vim.opt.foldnestmax = 10
vim.opt.foldmethod = "indent" -- fold based on indent level
vim.opt.colorcolumn = '120'

-- Window options
vim.wo.wrap = false
vim.wo.number = true
--vim.wo.cursorline = false
--vim.wo.signcolumn = 'yes'
--vim.wo.relativenumber = true

--vim.g.markdown_fenced_languages = {
--  "ts=typescript"
--}

vim.g['airline#extensions#tabline#enabled'] = 1

vim.api.nvim_set_keymap('n', '<C-Left>', ':tabprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', ':tabnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':tabprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':tabnext<CR>', { noremap = true, silent = true })

--vim.api.nvim_set_keymap('n', '<A-c', '<cmd>BufferClose<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<A-p', '<cmd>BufferPin<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<A-,', '<cmd>BufferPrevious<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<A-.', '<cmd>BufferNext<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>t', ':GFiles<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F8>', ':TagbarToggle<CR>', { noremap = true, silent = true })

-- NERDTree Keymaps
--vim.api.nvim_set_keymap('n', '<F8>', ':TagbarToggle<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<Leader>n', ':NERDTreeFocus<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<Leader>nf', ':NERDTreeFind<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<C-A-l>', ':NERDTreeFind<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<Leader>nt', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
--vim.g.NERDTreeShowHidden = 1

-- Folding
vim.api.nvim_set_keymap('n', '<space>', 'za', { noremap = true, silent = true })

-- Easymotion settings
vim.g.EasyMotion_do_mapping = 0
vim.g.EasyMotion_smartcase = 1
vim.api.nvim_set_keymap('n', '<Leader>s', '<Plug>(easymotion-s2)', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-S-N>', ':Files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-F>', ':Rg<CR>', { noremap = true, silent = true })

-- Start NERDTree when vim starts
--vim.api.nvim_create_autocmd("VimEnter", {
--  pattern = "*",
--  command = "NERDTree | wincmd p"
--})

-- Keep same NERDTree on every tab
--vim.api.nvim_create_autocmd("BufWinEnter", {
--  pattern = "*",
--  callback = function()
--    if vim.bo.buftype ~= "quickfix" and vim.fn.getcmdwintype() == "" then
--      vim.cmd("silent NERDTreeMirror")
--    end
--  end,
--})

require("nvim-tree").setup({
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  view = {
    adaptive_size = true
  }
})

vim.api.nvim_create_autocmd("TabEnter", {
  callback = function()
    require("nvim-tree.api").tree.open()
  end
})

-- ZIG

-- Formatting with ZLS matches `zig fmt`.
-- The Zig FAQ answers some questions about `zig fmt`:
-- https://github.com/ziglang/zig/wiki/FAQ
--vim.api.nvim_create_autocmd('BufWritePre',{
--  pattern = {"*.zig", "*.zon"},
--  callback = function(ev)
--    vim.lsp.buf.format()
--  end
--})

local on_attach = function(client, bufnr)
    vim.api.nvim_set_keymap('n', '<C-r><C-r>', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-S-I>', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })
end

local nvim_lsp = require('lspconfig')

nvim_lsp.denols.setup({
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
  settings = {
    deno = {
      inlayHints = {
        parameterNames = { enabled = "all", suppressWhenArgumentMatchesName = true },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = true, suppressWhenTypeMatchesName = true },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enable = true },
        enumMemberValues = { enabled = true },
      }
    }
  }
})

nvim_lsp.zls.setup({
  -- Only map shortcuts when in lsp mode
  on_attach = on_attach,

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
})

--require('nvim-treesitter').setup({
--  ensure_installed = { "typescript", "tsx", "javascript" },
--  highlight = { enable = true },
--})

