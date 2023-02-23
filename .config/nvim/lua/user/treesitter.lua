local langs = require 'user.config.syntax'

require('nvim-treesitter.configs').setup {
  ensure_installed = langs,
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = false
  }
}
