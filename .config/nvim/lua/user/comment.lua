local c_maps = require('user.config.keymaps').comment

require('Comment').setup {
  toggler = {
    line = c_maps.line.key
  },
  opleader = {
    line = c_maps.selection.key
  }
}