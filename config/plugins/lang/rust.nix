{ pkgs, lib, ... }:
{
  plugins = {
    rustaceanvim = {
      enable = true;
      settings = {
        server = {
          on_attach = ''
            function(_, bufnr)
              vim.keymap.set("n", "<leader>cR", function()
                vim.cmd.RustLsp("codeAction")
              end, { desc = "Code Action", buffer = bufnr })
              vim.keymap.set("n", "<leader>dr", function()
                vim.cmd.RustLsp("debuggables")
              end, { desc = "Rust Debuggables", buffer = bufnr })

              -- Ensure autoimport suggestions work
              vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                callback = function()
                  vim.lsp.buf.format({ async = false })
                  vim.lsp.buf.code_action({
                    context = { only = { "source.organizeImports" } },
                    apply = true
                  })
                end
              })
            end
          '';
          default_settings = {
            rust-analyzer = {
              cargo = {
                allFeatures = true;
                loadOutDirsFromCheck = true;
                buildScripts.enable = true;
              };
              check = {
                command = "clippy"; # Use clippy for better diagnostics
              };
              diagnostics = {
                enable = true;
                experimental.enable = true; # Enable experimental diagnostics
                disabled = [ ]; # Enable all diagnostics
              };
              procMacro = {
                enable = true;
                ignored = {
                  async-trait = [ "async_trait" ];
                  napi-derive = [ "napi" ];
                  async-recursion = [ "async_recursion" ];
                };
              };
              inlayHints = {
                bindingModeHints.enable = true;
                closingBraceHints.enable = true;
                lifetimeElisionHints.enable = "always";
                reborrowHints.enable = "always";
                typeHints.enable = true;
              };
            };
          };
        };
      };
    };
  };
}
