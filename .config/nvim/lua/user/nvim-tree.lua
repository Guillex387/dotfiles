local nt_maps = require('user.config.keymaps').nvim_tree
local keymap = function (map, func)
  vim.keymap.set('n', map.key, function() vim.cmd(func) end, { desc = map.desc })
end

require('nvim-tree').setup {
  view = {
    mappings = {
      list = {
        -- Override default mappings
        { key = nt_maps.cd.key, action = 'cd' }
      }
    }
  }
}

keymap(nt_maps.toggle, 'NvimTreeToggle')
keymap(nt_maps.focus, 'NvimTreeFocus')