local nt_maps = require('user.config.keymaps').nvim_tree

local keymap = function (map, func)
  vim.keymap.set('n', map.key, func, { desc = map.desc })
end

vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0

require('nvim-tree').setup {
  disable_netrw = true,
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  reload_on_bufenter = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
  view = {
    mappings = {
      list = {
        { key = nt_maps.cd.key, action = 'cd' }
      }
    }
  },
  diagnostics = {
    enable = true
  }
}

local api = require('nvim-tree.api')

keymap(nt_maps.toggle, api.tree.toggle)
