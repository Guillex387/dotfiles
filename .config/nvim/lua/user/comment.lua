local c_maps = require('user.config.keymaps').comment

require('Comment').setup {
  toggler = {
    line = c_maps.toggle.key
  },
  opleader = {
    line = c_maps.toggle.key
  }
}
