return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm<CR>', { desc = '[T]oggle [T]erminal' }),
    direction = 'float',
    float_opts = {
      border = 'curved',
    },
  },
}
