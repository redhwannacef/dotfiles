return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      overrides = function()
        return {
          LineNr = { bg = "NONE" },
          SignColumn = { bg = "NONE" },
          LineNrAbove = { bg = "NONE" },
          LineNrBelow = { bg = "NONE" },
        }
      end,
    })
    vim.cmd("colorscheme kanagawa")
  end,
}
