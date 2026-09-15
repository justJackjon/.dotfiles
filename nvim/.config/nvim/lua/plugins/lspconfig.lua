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
        -- Classic OmniSharp (omnisharp-roslyn) is unmaintained and can't load
        -- .NET 8+/net10.0 analyzers/source generators used in this repo
        -- (global.json pins SDK 10.0.108), which broke go-to-definition and
        -- caused it to spawn one server per *.csproj root. Disabled in favour
        -- of roslyn_ls below (same engine as VS/VSCode C# Dev Kit), which
        -- natively understands *.slnx and net10.0.
        omnisharp = false,
        roslyn_ls = {
          -- nvim-lspconfig's default cmd expects a binary literally named
          -- `Microsoft.CodeAnalysis.LanguageServer` on PATH (its manual-install
          -- convention). Mason's roslyn-language-server package exposes the
          -- same binary under a different name, so override cmd to match.
          cmd = {
            "roslyn-language-server",
            "--logLevel",
            "Information",
            "--extensionLogDirectory",
            vim.fs.joinpath(vim.uv.os_tmpdir(), "roslyn_ls/logs"),
            "--stdio",
          },
        },
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
