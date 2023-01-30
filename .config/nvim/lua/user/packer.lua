-- Set up packer tool
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
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
  -- LSP, Formaters, Linters config
  use {
    'neovim/nvim-lspconfig',
    requires = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'jose-elias-alvarez/null-ls.nvim',
      'jay-babu/mason-null-ls.nvim',
    },
  }
  -- Auto completion
  use {
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-path', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' }
  }
  -- Integrated terminal
  use 'akinsho/toggleterm.nvim'
  -- Auto closing tags
  use 'windwp/nvim-autopairs'
end)