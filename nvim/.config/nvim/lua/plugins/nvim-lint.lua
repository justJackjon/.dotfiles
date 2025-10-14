return {
  "mfussenegger/nvim-lint",
  config = function()
    -- NOTE: Configures linting for a repos with root and submodules.
    --       `terraform validate` is made conditional to run *only* in root modules
    --       (detected by files like `backend.tf`), avoiding errors that would
    --       otherwise occur in intentionally incomplete submodules.
    -- NOTE: Note that we can't know which root module our submodules are being used
    --       in, so we can't use the `-chdir` option or change the working directory
    --       of the `terraform validate` command reliably unless we know which root
    --       module is composing our submodules.

    local lint = require("lint")
    local original_tf_validate = lint.linters.terraform_validate

    lint.linters.terraform_validate = function()
      local current_dir = vim.fn.expand("%:p:h")
      local root_markers = { "backend.tf", "_backend.tf", "versions.tf", "providers.tf" }

      for _, marker in ipairs(root_markers) do
        local ok, stat = pcall(vim.uv.fs_stat, current_dir .. "/" .. marker)
        if ok and stat then
          return original_tf_validate()
        end
      end

      return {
        cmd = "true",
        parser = function()
          return {}
        end,
      }
    end

    lint.linters_by_ft = {
      terraform = { "terraform_validate" },
      tf = { "terraform_validate" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "BufEnter" }, {
      group = vim.api.nvim_create_augroup("Linter", { clear = true }),
      callback = function()
        if vim.bo.filetype == "terraform" or vim.bo.filetype == "tf" then
          lint.try_lint()
        end
      end,
    })
  end,
}
