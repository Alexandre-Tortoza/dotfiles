return -- Lua
{
  'folke/zen-mode.nvim',
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      '<leader>tz',
      function()
        require('zen-mode').toggle()
      end,
      desc = '[T]oggle [Z]en Mode',
    },
  },
}
