local icons = require 'user.config.icons'

local signs = {

  { name = 'DiagnosticSignError', text = icons.diagnostic.SignError },
  { name = 'DiagnosticSignHint', text = icons.diagnostic.SignHint },
  { name = 'DiagnosticSignWarn', text = icons.diagnostic.SignWarn },
  { name = 'DiagnosticSignInfo', text = icons.diagnostic.SignInfo },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
end

local config = {
  virtual_text = true,
  signs = {
    active = signs,
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
}

vim.diagnostic.config(config)