require('gitsigns').setup {
  on_attach = function(buffer)
    local git_maps = require('user.config.keymaps').git
    local keymap = function(map, func)
      vim.keymap.set('n', map.key,
        function() vim.cmd(func) end,
        { buffer = buffer, desc = map.desc })
    end
    keymap(git_maps.toggle, 'Gitsigns preview_hunk_inline')
  end
}
