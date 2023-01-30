require('telescope').setup {}

local t_maps = require('user.config.keymaps').telescope
local keymap = function (map, func)
  vim.keymap.set('n', map.key, func, { desc = map.desc })
end
local t_builtin = require('telescope.builtin')

keymap(t_maps.buffers, t_builtin.buffers)
keymap(t_maps.find_files, t_builtin.find_files)
keymap(t_maps.grep_string, t_builtin.grep_string)
keymap(t_maps.help_tags, t_builtin.help_tags)
keymap(t_maps.keymaps, t_builtin.keymaps)