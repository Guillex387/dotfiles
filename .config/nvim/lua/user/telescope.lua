require('telescope').setup {}

local t_maps = require('user.config.keymaps').telescope
local keymap = function (map, func)
  vim.keymap.set('n', map.key, func, { desc = map.desc })
end
local t_builtin = require('telescope.builtin')

keymap(t_maps.buffers, t_builtin.buffers)
keymap(t_maps.find_files, t_builtin.find_files)
-- Install ripgrep for use this feature
keymap(t_maps.live_grep, function()
  t_builtin.live_grep()
end
)
keymap(t_maps.help_tags, t_builtin.help_tags)
keymap(t_maps.keymaps, t_builtin.keymaps)
