local nt_maps = require('user.config.keymaps').nvim_tree
local keymap = function (map, func)
  vim.keymap.set('n', map.key, func, { desc = map.desc })
end

require('nvim-tree').setup {
  update_focused_file = {
    enable = true,
    update_root = true
  },
  view = {
    mappings = {
      list = {
        -- Override default mappings
        { key = nt_maps.cd.key, action = 'cd' }
      }
    }
  }
}

local api = require('nvim-tree.api')

keymap(nt_maps.toggle, api.tree.toggle)
keymap(nt_maps.focus, api.tree.focus)