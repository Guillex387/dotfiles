require('tabline').setup {
  enable = false,
  options = {
    show_filename_only = true,
    show_tabs_only = true
  }
}

require('lualine').setup {
  options = {
    icons_enable = true,
    theme = 'auto'
  },
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { require'tabline'.tabline_buffers },
    lualine_x = { require'tabline'.tabline_tabs },
    lualine_y = {},
    lualine_z = {},
  },
}
