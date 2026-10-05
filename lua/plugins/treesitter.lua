return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()

    require("neo-tree").setup({
      use_popups_for_input = false,
    })

    -- treesitter 
    require("nvim-treesitter").setup()

    require("nvim-treesitter").install({
      "lua",
      "go",
      "javascript",
      "c",
      "cpp",
      "python",
      "typescript",
      "java",
      "rust",
      "markdown",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "lua",
        "go",
        "javascript",
        "c",
        "cpp",
        "python",
        "typescript",
        "java",
        "rust",
        "markdown",
      },
      callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end
}
