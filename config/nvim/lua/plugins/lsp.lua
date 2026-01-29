return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      if opts.servers and opts.servers.vtsls then
        opts.servers.vtsls.settings.vtsls.suggest = {
          completeFunctionCalls = true,
          diagnostics = {
            missingFunction = true,
          },
        }
      end

      opts.inlay_hints = {
        enabled = false,
      }
    end,
  },
}
