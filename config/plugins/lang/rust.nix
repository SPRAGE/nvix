{ pkgs, lib, ... }:
{
  plugins = {
    rustaceanvim = {
      enable = true;
      settings = {
        settings = {
          server = {
            default_settings = {
              rust-analyzer = {
                installCargo = false;
                installRustc = false;
                cargo = {
                  allFeatures = true;
                };
                check = {
                  command = "clippy";
                };
                inlayHints = {
                  lifetimeElisionHints = {
                    enable = "always";
                  };
                };
              };
            };
            standalone = false;
          };
        };
      };
    };
  };

  #   conform-nvim.settings = {
  #     formatters_by_ft.python = [
  #       "ruff_format"
  #       "ruff_organize_imports"
  #     ];
  #   };
  #
  #   lint = {
  #     lintersByFt.python = [ "mypy" ];
  #     linters.mypy = {
  #       cmd = lib.getExe pkgs.mypy;
  #       args = [ "--ignore-missing-imports" ];
  #     };
  #   };
  #
  #   lsp.servers = {
  #     pyright = {
  #       enable = true;
  #       extraOptions.settings = {
  #         # Using Ruff's import organizer
  #         pyright.disableOrganizeImports = true;
  #         python.analysis = {
  #           # Ignore all files for analysis to exclusively use Ruff for linting
  #           ignore.__raw = ''{ '*' }'';
  #         };
  #       };
  #     };
  #
  #     ruff = {
  #       enable = true;
  #       onAttach.function = ''
  #         if client.name == 'ruff' then
  #           -- Disable hover in favor of Pyright
  #           client.server_capabilities.hoverProvider = false
  #         end
  #       '';
  #     };
  #   };
  # };
}
