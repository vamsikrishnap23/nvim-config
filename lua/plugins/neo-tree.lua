return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  config = function()
    -- neo-tree keymap
    vim.keymap.set('n', '<C-n>', ':Neotree filesystem toggle left<CR>', {})
    -- Easier window navigation
    vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Navigate Left' })
    vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Navigate Down' })
    vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Navigate Up' })
    vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Navigate Right' })
  end
}

