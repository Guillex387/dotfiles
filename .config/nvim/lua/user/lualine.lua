require('lualine').setup {
  options = {
    icons_enable = true,
    theme = 'auto'
  }
}

require('tabline').setup {
  enable = true,
  options = {
    show_filename_only = true
  }
}