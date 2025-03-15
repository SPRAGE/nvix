{ pkgs, lib, ... }:
{
  plugins = {
    rustaceanvim = {
      enable = true;
      settings = {
        server = {
          on_attach = ''
            function(_, bufnr)
              vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                callback = function()
                  vim.lsp.buf.code_action({
                    context = { only = { "source.organizeImports" } },
                    apply = true
                  })
                end
              })
              vim.api.nvim_create_autocmd("CursorHold", {
                buffer = bufnr,
                callback = function()
                  vim.diagnostic.open_float(nil, { focusable = false })
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
              checkOnSave = {
                overrideCommand = [
                  "cargo"
                  "check"
                  "--all-targets"
                  "--message-format=json"
                ];
              };
              diagnostics = {
                enable = true;
                experimental.enable = true;
                disabled = [ ];
              };
              imports = {
                granularity = {
                  group = "module";
                };
                prefix = "self";
              };
              procMacro = {
                enable = true;
                ignored = {
                  async-trait = [ "async_trait" ];
                  napi-derive = [ "napi" ];
                  async-recursion = [ "async_recursion" ];
                };
              };
            };
          };
        };
      };
    };
  };
}
