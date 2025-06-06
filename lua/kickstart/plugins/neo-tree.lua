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
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  config = function()
    require('neo-tree').setup {
      close_if_last_window = true,
      window = {
        width = 50,
      },
      filesystem = {
        window = {
          mappings = {
            ['\\'] = 'close_window',
          },
        },
        filtered_items = {
          visible = true,
        },
        follow_current_file = {
          enabled = true,
        },
        buffers = {
          follow_current_file = true,
        },
      },
    }
  end,
}
