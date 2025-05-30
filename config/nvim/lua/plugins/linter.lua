return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")
    local lint_autogroup = vim.api.nvim_create_augroup("lint", { clear = true })
    local eslint = lint.linters.eslint
    lint.linters_by_ft = {
      javascript = { "eslint" },
      typescript = { "eslint" },
      javascriptreact = { "eslint" },
      typescriptreact = { "eslint" },
      python = { "mypy" }
    }

    eslint.args = {
      "--no-warn-ignored",
      "--format",
      "json",
      "--stdin",
      "--stdin-filename",
      function()
        return vim.fn.expand("%:p")
      end
    }

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_autogroup,
      callback = function()
        lint.try_lint()
      end
    })

    -- vim.keymap.set("n", "<leader>l",
    --   function()
    --     lint.try_lint()
    --   end,
    --   { desc = "Trigger linting for current file" }
    -- )
  end
}
