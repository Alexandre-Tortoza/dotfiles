-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['o'] = 'system_open',
        },
      },
    },
    event_handlers = {

      {
        event = "file_open_requested",
        handler = function()
          require("neo-tree.command").execute({ action = "close" })
        end
      },

    },
    commands = {
      system_open = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        local is_file = vim.fn.isdirectory(path) == 0
        if is_file then
          path = vim.fn.fnamemodify(path, ":h")
        end
        local win_path = vim.fn.system({ "wslpath", "-w", path }):gsub("\n", "")
        vim.fn.jobstart({ "explorer.exe", win_path }, { detach = true })
      end      
  },
}
}
