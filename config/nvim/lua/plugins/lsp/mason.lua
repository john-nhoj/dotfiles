return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    local mason = require("mason")
    local mLspconfig = require("mason-lspconfig")
    mason.setup({
      ensure_installed = {
        "eslint",
        "tflint",
      },
    })
    mLspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "bashls",
        "docker_compose_language_service",
        "dockerls",
        "postgres_lsp",
        "pyright",
        "tailwindcss",
        "terraformls",
        "ts_ls",
        "volar",
      },
    })
  end
}
