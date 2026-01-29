return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true,
          },
        },
        formatters = {
          file = {
            filename_first = true,
          },
        },
        win = {
          preview = {
            wo = {
              -- keep relative line numbers when the preview reuses the main window (e.g. lines picker)
              relativenumber = true,
            },
          },
        },
      },
    },
    keys = {
      {
        "<leader>sb",
        function()
          Snacks.picker.lines({ layout = { preset = "default" } })
        end,
        desc = "Buffer Lines",
      },
    },
  },
}
