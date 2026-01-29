local function get_lsp_root()
  local clients = vim.lsp.get_active_clients({ bufnr = 0 })
  for _, client in ipairs(clients) do
    local workspace_folders = client.config.workspace_folders
    if workspace_folders and #workspace_folders > 0 then
      print(vim.uri_to_fname(workspace_folders[1].uri))
      return vim.uri_to_fname(workspace_folders[1].uri)
    elseif client.config.root_dir then
      print(client.config.root_dir)
      return client.config.root_dir
    end
  end
  return vim.loop.cwd()
end

vim.api.nvim_create_user_command("TestLspRoot", function()
  local root = get_lsp_root()
  print("Detected root:", root)
end, {})

return {
  "nvim-neotest/neotest",
  dependencies = {
    "marilari88/neotest-vitest",
  },
  opts = {
    adapters = {
      ["neotest-vitest"] = {
        root = get_lsp_root,
      },
    },
  },
}
