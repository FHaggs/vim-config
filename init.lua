-- Set options
vim.o.relativenumber = true
vim.o.number = true
vim.g.mapleader = " "
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.background = "dark"
vim.o.laststatus = 2
vim.o.statusline = "%f"

-- Key mappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Yank and paste from system clipboard
map('n', '<Leader>y', '"+yy', opts)
map('v', '<Leader>y', '"+y', opts)
map('n', '<Leader>p', '"+p', opts)
map('v', '<Leader>p', '"+p', opts)

-- Buffer navigation
map('n', '<Leader>j', ':bnext<CR>', opts)
map('n', '<Leader>k', ':bprevious<CR>', opts)
map('n', '<Leader>s', ':w<CR>:bd<CR>', opts)
map('n', '<Leader>q', ':bd!<CR>', opts)

-- FZF commands
map('n', '<Leader>b', ':Buffers<CR>', opts)
map('n', '<Leader>f', ':Files<CR>', opts)
map('n', '<Leader>g', ':GFiles<CR>', opts)
map('n', '<Leader>v', ':Rg<Space>', opts)

-- Insert mode mappings for auto-pairing
map('i', '"', '""<left>', opts)
map('i', "'", "''<left>", opts)
map('i', '(', '()<left>', opts)
map('i', '[', '[]<left>', opts)
map('i', '{', '{}<left>', opts)
map('i', '{<CR>', '{<CR>}<ESC>O', opts)
map('i', '{;<CR>', '{<CR>};<ESC>O', opts)

-- Open file explorer
map('n', '<Leader>t', ':Ex<CR>', opts)

-- Centering after page movements
map('n', '<C-D>', '<C-D>zz', opts)
map('n', '<C-U>', '<C-U>zz', opts)

-- Plugins
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- FZF and related plugins
  use {'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
  use 'junegunn/fzf.vim'
  -- Gruvbox colorscheme
  use 'morhetz/gruvbox'
  -- Neovim LSP and completion
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  -- Other plugins can be added here

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Colorscheme
vim.cmd('colorscheme gruvbox')

-- LSP settings
local lspconfig = require('lspconfig')
local cmp = require('cmp')
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


-- Enable LSP

lspconfig.pyright.setup{

  capabilities = capabilities,

}
-- Enable LSP for Python with Pyright
lspconfig.pyright.setup{
  capabilities = capabilities,
}

-- Enable LSP for C with ccls
lspconfig.ccls.setup{
  capabilities = capabilities,
}

-- Set up completion
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- You can integrate your preferred snippet engine here
    end,
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Up>'] = cmp.mapping.select_prev_item(),
    ['<Down>'] = cmp.mapping.select_next_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  })
})

-- Additional LSP key mappings
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', '<leader>e', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
map('v', '<leader>e', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

