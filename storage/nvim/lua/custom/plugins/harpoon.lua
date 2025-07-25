return {
  'theprimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('harpoon'):setup()
  end,
  keys = {
    {
      '<leader>ha',
      function()
        require('harpoon'):list():append()
      end,
      desc = '[H]arpoon [A]dd file',
    },
    {
      '<leader>h',
      function()
        local harpoon = require 'harpoon'
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = '[H]arpoon quick menu',
    },
    {
      '<leader>h1',
      function()
        require('harpoon'):list():select(1)
      end,
      desc = '[H]arpoon to file 1',
    },
    {
      '<leader>h2',
      function()
        require('harpoon'):list():select(2)
      end,
      desc = '[H]arpoon to file 2',
    },
    {
      '<leader>h3',
      function()
        require('harpoon'):list():select(3)
      end,
      desc = '[h]arpoon to file 3',
    },
    {
      '<leader>h4',
      function()
        require('harpoon'):list():select(4)
      end,
      desc = '[H]arpoon to file 4',
    },
    {
      '<leader>h5',
      function()
        require('harpoon'):list():select(5)
      end,
      desc = '[H]arpoon to file 5',
    },
    {
      '<leader>hd',
      function()
        require('harpoon'):list():remove()
      end,
      desc = '[H]arpoon [R]emove',
    },
  },
}
