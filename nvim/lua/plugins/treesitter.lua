-- ==============================
--  Treesitter Syntax Highlighting
-- ==============================

local parsers = {
  "javascript",
  "typescript",
  "tsx",
  "json",
  "css",
  "html",
  "lua",
}

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup()
    require("nvim-treesitter").install(parsers)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = parsers,
      callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
