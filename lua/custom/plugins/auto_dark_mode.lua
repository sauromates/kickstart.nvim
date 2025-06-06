return {
  'f-person/auto-dark-mode.nvim',
  opts = {
    set_dark_mode = function()
      vim.cmd.colorscheme 'nordfox'
    end,
    set_light_mode = function()
      vim.cmd.colorscheme 'dayfox'
    end,
  },
}
