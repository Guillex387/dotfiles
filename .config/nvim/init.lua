-- Set up packer tool
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'
  -- Color scheme
  use {
    'catppuccin/nvim',
    as = 'catppuccin'
  }
  -- Dev icons
  use 'nvim-tree/nvim-web-devicons'
  -- Status line
  use 'nvim-lualine/lualine.nvim'
  -- Buffer line
  use 'kdheepak/tabline.nvim'
  -- File explorer
  use 'nvim-tree/nvim-tree.lua'
  -- Search engine
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  -- Syntax highlight
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end
  }
  -- Indent highlight
  use 'lukas-reineke/indent-blankline.nvim'
  -- Git highlights
  use 'lewis6991/gitsigns.nvim'
  -- Comment utilitie
  use 'numToStr/Comment.nvim'
  -- Language server
  -- TODO: add lsp plugin
  -- Formater
  -- TODO: add null-ls plugin
  -- Auto completion
  -- TODO: add vim-cmp plugin
  -- Language support manager
  -- TODO: add Mason plugin
end)

if is_boostrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Editor config

vim.cmd.colorscheme 'catppuccin'
vim.opt.mouse = ''
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true

-- Plugins config

require('catppuccin').setup {
  flavour = 'mocha',
  term_colors = false,
  transparent_background = false
}

require('nvim-web-devicons').setup {}

require('lualine').setup {
  options = {
    icons_enable = true,
    theme = 'auto'
  }
}

require('tabline').setup {
  enable = true
}

require('nvim-tree').setup {}

require('telescope').setup {}

require('nvim-treesitter.configs').setup {
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'help', 'vim' },
  highlight = { enable = true },
  incremental_selection = { enable = false }
}

require('indent_blankline').setup {
  char = '┊'
}

require('gitsigns').setup {}

require('Comment').setup {
  opleader = {
    -- Comment selection
    line = 'gg'
  }
}

-- Keymaps

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
local cmd_callback = function(command)
  return function() vim.cmd(command) end
end

-- Telescope maps
local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sb', telescope_builtin.buffers, { desc = '[S]earch existing [B]uffers' })
vim.keymap.set('n', '<leader>sf', telescope_builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', telescope_builtin.grep_string, { desc = '[S]earch [S]tring' })
vim.keymap.set('n', '<leader>sh', telescope_builtin.help_tags, { desc = '[S]earch [H]elp' })

-- Nvim-tree maps
vim.keymap.set('n', '<leader>ee', cmd_callback('NvimTreeToggle'), { desc = 'Toggle [E]xplorer'})
vim.keymap.set('n', '<leader>ef', cmd_callback('NvimTreeFocus'), { desc = '[E]xplorer [F]ocus'})

-- Buffer tab maps
vim.keymap.set('n', '<TAB>', cmd_callback('TablineBufferNext'), { desc = 'Switch to next buffer' })
vim.keymap.set('n', '<S-TAB>', cmd_callback('TablineBufferPrevious'), { desc = 'Switch to previous buffer' })
vim.keymap.set('n', '<C-w>', cmd_callback('bw'), { desc = 'Close a buffer' })

-- Splits navigation
vim.keymap.set('n', '<C-h>', cmd_callback('wincmd h'), { desc = 'Move to left split' })
vim.keymap.set('n', '<C-l>', cmd_callback('wincmd l'), { desc = 'Move to right split' })
vim.keymap.set('n', '<C-j>', cmd_callback('wincmd j'), { desc = 'Move to bottom split' })
vim.keymap.set('n', '<C-k>', cmd_callback('wincmd k'), { desc = 'Move to top split' })