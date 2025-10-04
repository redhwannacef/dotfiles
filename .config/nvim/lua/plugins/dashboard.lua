return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
        keys = {
          { icon = " ", key = "p", desc = "All Projects", action = ":lua Snacks.picker.projects()" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        { section = "header" },
        { icon = " ", title = "Latest Projects", padding = 1 },
        { section = "projects", indent = 2, gap = 1, padding = 1 },
        { section = "keys", gap = 1, padding = 2 },
        { section = "startup" },
      },
    },
  },
}
