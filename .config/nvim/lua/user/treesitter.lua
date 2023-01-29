local langs = require 'user.config.syntax'

require('nvim-treesitter.configs').setup {
  ensure_installed = langs,
  highlight = { enable = true },
  incremental_selection = { enable = false }
}