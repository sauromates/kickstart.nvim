local term_state = {
  buf = -1,
  win = -1,
}

local function create_terminal_window(opts)
  opts = opts or {}

  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  local width = opts.width or math.floor(vim.o.columns * 1.0)
  local height = opts.height or math.floor(vim.o.lines * 0.3)

  -- Calculate the position to center the window
  -- local col = math.floor((vim.o.columns - width) / 2)
  -- local row = math.floor((vim.o.lines - height) / 2)

  -- Define window configuration
  local win_config = {
    relative = 'editor',
    width = width,
    height = height,
    col = 0,
    row = vim.o.lines - height - 1,
    style = 'minimal', -- No borders or extra UI elements
    border = 'rounded',
  }
  local win = vim.api.nvim_open_win(buf, true, win_config)
  vim.api.nvim_set_option_value('winhighlight', 'Normal:Normal,NormalNC:Normal', { win = win })

  return { buf = buf, win = win }
end

local function toggle_terminal()
  if not vim.api.nvim_win_is_valid(term_state.win) then
    term_state = create_terminal_window { buf = term_state.buf }
    if vim.bo[term_state.buf].buftype ~= 'terminal' then
      vim.cmd.term()
      vim.cmd 'startinsert!'
    end
  else
    vim.api.nvim_win_hide(term_state.win)
  end
end

vim.keymap.set('n', '<space>tt', function()
  toggle_terminal()
end, { desc = '[T]oggle [t]erminal' })
-- vim.keymap.set('n', '<space>tt', function()
--   vim.cmd.vnew()
--   vim.cmd.term()
--   vim.cmd.wincmd 'J'
--   vim.api.nvim_win_set_height(0, 5)
-- end, { desc = '[T]oggle [t]erminal' })
