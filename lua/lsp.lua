vim.lsp.enable({ "ty" })

local function await_client_stopped(client)
  -- Wait up to 2000ms, polling every 10ms
  vim.wait(2000, function()
    return client:is_stopped()
  end, 10, false)

  return client:is_stopped()
end

local function restart_lsp_for_current_buffer()
  coroutine.wrap(function()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })

    for _, client in ipairs(clients) do
      local config = client.config

      -- Stop only if not already stopping
      if not client:is_stopped() then
        client:stop()
      end

      -- Suspends until client is actually stopped
      await_client_stopped(client)

      -- Restart once fully stopped
      vim.lsp.start(config)
    end
  end)()
end

vim.api.nvim_create_user_command("LspRestart", restart_lsp_for_current_buffer, {})

