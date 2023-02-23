local l_maps = require('user.config.keymaps').lsp
local linters = require 'user.config.linters'
local servers = require 'user.config.lsp-servers'

-- Lsp & Null-ls keymaps

local on_attach = function(client, buffer)
  client.server_capabilities.document_formatting = false
  local keymap = function(map, func)
    vim.keymap.set('n', map.key, func, { buffer = buffer, desc = map.desc })
  end
  keymap(l_maps.rename, vim.lsp.buf.rename)
  keymap(l_maps.code_action, vim.lsp.buf.code_action)
  keymap(l_maps.definition, vim.lsp.buf.definition)
  keymap(l_maps.implementation, vim.lsp.buf.implementation)
  keymap(l_maps.type, vim.lsp.buf.type_definition)
  keymap(l_maps.symbols, require('telescope.builtin').lsp_dynamic_workspace_symbols)
  keymap(l_maps.documentation, vim.lsp.buf.hover)
  keymap(l_maps.format, vim.lsp.buf.formatting)
  keymap(l_maps.diagnostic, vim.diagnostic.open_float)
end


-- Lsp & Null-ls setup

require('mason').setup {}

local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = servers
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach
    }
  end
}

local mason_null_ls = require 'mason-null-ls'

mason_null_ls.setup {
  ensure_installed = linters,
  automatic_setup = true
}

mason_null_ls.setup_handlers()
