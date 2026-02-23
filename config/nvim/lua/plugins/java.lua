return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      -- Remove Lombok javaagent that is added by default
      opts.cmd = { vim.fn.exepath("jdtls") }

      -- Force project source to be root repo so packages are resolved
      opts.settings = vim.tbl_deep_extend("force", opts.settings or {}, {
        java = {
          project = {
            sourcePaths = { "." },
          },
        },
      })
    end,
  },
}
