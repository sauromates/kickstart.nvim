return {
  'sauromates/neotest-phpunit',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local neotest = require 'neotest'

    vim.keymap.set('n', '<leader>ntr', function()
      neotest.run.run()
    end, { desc = 'NeoTest [r]un nearest test' })

    vim.keymap.set('n', '<leader>ntf', function()
      neotest.run.run(vim.fn.expand '%')
    end, { desc = 'NeoTest run [f]ile' })

    vim.keymap.set('n', '<leader>nts', function()
      neotest.summary.toggle()
    end, { desc = 'NeoTest [s]ummary toggle' })
  end,
}
