vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = " "

local terminal_buf = nil
local terminal_win = nil

vim.keymap.set("n", "<leader>t", function()
  -- 1. If the window is currently open, close it (hide terminal)
  if terminal_win and vim.api.nvim_win_is_valid(terminal_win) then
    vim.api.nvim_win_close(terminal_win, true)
    terminal_win = nil
    return
  end

  -- 2. Open a vertical split on the far right
  vim.cmd("botright vsplit")
  terminal_win = vim.api.nvim_get_current_win()

  -- 3. If the terminal buffer already exists, load it. Otherwise, create a new one.
  if terminal_buf and vim.api.nvim_buf_is_valid(terminal_buf) then
    vim.api.nvim_win_set_buf(terminal_win, terminal_buf)
  else
    vim.cmd("terminal")
    terminal_buf = vim.api.nvim_get_current_buf()
  end
  
  -- 4. Automatically enter insert mode so you can type immediately
  vim.cmd("startinsert")
end, { desc = "Toggle Terminal on the Right" })

-- Press 'Esc' twice to exit terminal insert mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })



vim.diagnostic.config({
  float = true,
  jump = {
    wrap = true,
  },
  severity_sort = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  virtual_lines = false,
  virtual_text = true,
})
