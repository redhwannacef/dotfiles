-- if true then
--   return {}
-- end

-- return {
--   "nickkadutskyi/jb.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {},
--   config = function()
--     -- require("jb").setup({ transparent = true })
--     vim.cmd("colorscheme jb")
--   end,
-- }

return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      overrides = function(colors)
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
