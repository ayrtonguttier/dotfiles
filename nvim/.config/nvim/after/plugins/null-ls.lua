local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier.with({
      filetypes = { "json", "jsonc" },
    }),
  },
})

-- Optional: Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.json", "*.jsonc" },
  callback = function()
    vim.lsp.buf.format({ timeout_ms = 2000 })
  end,
})
