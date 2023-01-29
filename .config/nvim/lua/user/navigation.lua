local keymap = function (map, func)
  vim.keymap.set('n', map.key, function() vim.cmd(func) end, { desc = map.desc })
end
local n_maps = require('user.config.keymaps').navigation

keymap(n_maps.next_buf, 'TablineBufferNext')
keymap(n_maps.prev_buf, 'TablineBufferPrevious')
keymap(n_maps.close_buf, 'bd')
keymap(n_maps.close_force_buf, 'bd!')
keymap(n_maps.win_left, 'wincmd h')
keymap(n_maps.win_right, 'wincmd l')
keymap(n_maps.win_down, 'wincmd j')
keymap(n_maps.win_up, 'wincmd k')