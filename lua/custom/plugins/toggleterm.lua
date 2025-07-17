return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm<CR>', { desc = 'Toggle terminal' }),
    direction = 'float',
    float_opts = {
      border = 'curved'
    }
  },
}
