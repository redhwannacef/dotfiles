return {
  {
    "mg979/vim-visual-multi",
    branch = "master",
    config = function()
      local opts = { silent = true, noremap = false }
      vim.keymap.set({ "n", "v" }, "<A-Down>", "<Plug>(VM-Add-Cursor-Down)", opts)
      vim.keymap.set({ "n", "v" }, "<A-Up>", "<Plug>(VM-Add-Cursor-Up)", opts)
    end,
  },
}
