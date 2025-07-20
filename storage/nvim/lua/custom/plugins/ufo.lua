return {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  event = 'BufReadPost',
  init = function()
    vim.o.foldmethod = 'manual' -- UFO exige manual
    vim.o.foldcolumn = '0' -- coluna de fold visível (pode ser "0")
    vim.o.foldlevel = 99 -- evita que folds fechem no open
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
  opts = {
    provider_selector = function(bufnr, filetype, buftype)
      return { 'treesitter', 'indent' }
    end,
  },
  config = function(_, opts)
    require('ufo').setup(opts)

    vim.keymap.set('n', '<leader>uO', require('ufo').openAllFolds, { desc = '[U]fo [O]pen all folds' })
    vim.keymap.set('n', '<leader>uC', require('ufo').closeAllFolds, { desc = '[U]FO: [C]lose all folds' })
    vim.keymap.set('n', '<leader>uo', 'zo', { desc = '[U]FO: Open fold under cursor' })
    vim.keymap.set('n', '<leader>uc', 'zc', { desc = '[U]FO: Close fold under cursor' })
    vim.keymap.set('n', '<leader>up', function()
      local winid = require('ufo').peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end, { desc = '[U]FO [P]aek fold or LSP hover' })
  end,
}
