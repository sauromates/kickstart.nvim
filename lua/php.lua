-- Needed since php_cs_fixer doesn't support PHP 8.4 yet
-- TODO remove later
vim.env.PHP_CS_FIXER_IGNORE_ENV = 1

--- Create PHP opening tag for new PHP files
vim.api.nvim_create_autocmd('BufNewFile', {
  pattern = '*.php',
  callback = function()
    vim.api.nvim_buf_set_lines(0, 0, 0, false, { '<?php', '' })
    vim.api.nvim_win_set_cursor(0, { 3, 0 })
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*.php',
  callback = function()
    vim.opt_local.autoindent = true
  end,
})

-- local function insert_multiline_comment()
--   local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
--   local line = vim.api.nvim_get_current_line()
--   local target_row = row
--   if line:len() == 0 then
--     target_row = row + 1
--   end
--   local indent = line:match '^(%s*)' or ''
--
--   local lines = {
--     indent .. '/**',
--     indent .. ' * ',
--     indent .. ' */',
--   }
--
--   vim.api.nvim_buf_set_lines(0, target_row, target_row, false, lines)
--   vim.api.nvim_win_set_cursor(0, { row + 2, #indent + 3 })
--   vim.api.nvim_feedkeys('', 'n', false)
-- end
--
-- vim.keymap.set('n', 'gcm', insert_multiline_comment)
--
-- Macros --
local esc = vim.api.nvim_replace_termcodes('<Esc>', true, true, true)

--- Register a `dd` macro
--- Any visually selected block would be copied inside
--- a `dd()` call on the next line
---
--- Usage:
--- 1. Select something in visual mode
--- 2. Press '@d' to invoke the macro
vim.fn.setreg('d', 'yodd(' .. esc .. 'pa);' .. esc)
