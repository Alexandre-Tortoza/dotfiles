return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    on_attach = function(client)
      client.server_capabilities.documentFormattingProvider = false
    end,
    settings = {
      jsx_close_tag = {
        enable = true,
        filetypes = { 'javascriptreact', 'typescriptreact' },
      },
      tsserver_plugins = { '@styled/typescript-styled-plugin' },
    },
  },
}
