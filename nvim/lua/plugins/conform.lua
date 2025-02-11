return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        typescript = { "prettier", lsp_format = "last" },
        javascript = { "prettier", lsp_format = "last" },
        typescriptreact = { "prettier", lsp_format = "last" },
        javascriptreact = { "prettier", lsp_format = "last" },
      },
    },
  },
}
