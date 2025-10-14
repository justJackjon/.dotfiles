return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        float = {
          source = "always",
        },
        virtual_text = {
          source = "always",
        },
      },
      servers = {
        terraformls = {
          root_dir = function(fname)
            -- NOTE: Uses reliable terraform root module indicators to find the root directory.
            return require("lspconfig.util").root_pattern(
              "backend.tf",
              "_backend.tf",
              "versions.tf",
              "providers.tf",
              ".git"
            )(fname)
          end,
        },
      },
    },
  },
}
