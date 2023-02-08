require('toggleterm').setup {
  open_mapping = require('user.config.keymaps').toggleterm.toggle.key,
  auto_scroll = true,
  hide_numbers = true,
  autochdir = true,
  winbar = {
    enabled = false
  },
  direction = 'horizontal'
}
