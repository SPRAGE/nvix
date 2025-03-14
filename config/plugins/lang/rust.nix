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
            end
          '';
          default_settings = {
            rust-analyzer = {
              cargo = {
                allFeatures = true;
                loadOutDirsFromCheck = true;
                buildScripts = {
                  enable = true;
                };
              };
              # Enable clippy lints for Rust
              checkOnSave = true;
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
      config = ''
        vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
        if vim.fn.executable("rust-analyzer") == 0 then
          vim.notify(
            "**rust-analyzer** not found in PATH, please install it.\nhttps://rust-analyzer.github.io/",
            vim.log.levels.ERROR
          )
        end
      '';
    };
  };
}
