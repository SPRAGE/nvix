{ pkgs, ... }:
{
  plugins = {
    rustaceanvim = {
      enable = true;
      settings = {

        dap = {
          autoloadConfigurations = true;
        };

        server = {
          enable = true;
          autoStart = true;
          default_settings = {
            rust-analyzer = {
              cargo = {
                buildScripts.enable = true;
                features = "all";
              };

              diagnostics = {
                enable = true;
                experimental.enable = true; # ✅ Fixes missing imports & better suggestions
                styleLints.enable = true;
              };

              checkOnSave = true; # ✅ Must be a boolean (not an attribute set)

              check = {
                command = "clippy";
                features = "all";
                extraArgs = [ "--all-targets" ]; # ✅ Moved from overrideCommand
              };

              files = {
                excludeDirs = [
                  ".cargo"
                  ".direnv"
                  ".git"
                  "node_modules"
                  "target"
                ];
              };

              inlayHints = {
                bindingModeHints.enable = true;
                closureStyle = "rust_analyzer";
                closureReturnTypeHints.enable = "always";
                discriminantHints.enable = "always";
                expressionAdjustmentHints.enable = "always";
                implicitDrops.enable = true;
                lifetimeElisionHints.enable = "always";
                rangeExclusiveHints.enable = true;
              };

              procMacro = {
                enable = true;
              };

              rustc.source = "discover";

              imports = {
                granularity = {
                  group = "module";
                }; # ✅ Helps with auto-imports
                prefix = "self";
              };

              lsp = {
                debounceTextChanges = 150; # ✅ Prevents "content modified" errors
              };
            };
          };
        };
      };
    };
  };
}

# { pkgs, ... }:
# {
#
#   plugins = {
#     rustaceanvim = {
#       enable = true;
#       settings = {
#
#         dap = {
#           autoloadConfigurations = true;
#         };
#
#         server = {
#           enable = true;
#           autoStart = true;
#           default_settings = {
#             rust-analyzer = {
#               cargo = {
#                 buildScripts.enable = true;
#                 features = "all";
#               };
#
#               diagnostics = {
#                 enable = true;
#                 styleLints.enable = true;
#               };
#
#               checkOnSave = true;
#               check = {
#                 command = "clippy";
#                 features = "all";
#               };
#
#               files = {
#                 excludeDirs = [
#                   ".cargo"
#                   ".direnv"
#                   ".git"
#                   "node_modules"
#                   "target"
#                 ];
#               };
#
#               inlayHints = {
#                 bindingModeHints.enable = true;
#                 closureStyle = "rust_analyzer";
#                 closureReturnTypeHints.enable = "always";
#                 discriminantHints.enable = "always";
#                 expressionAdjustmentHints.enable = "always";
#                 implicitDrops.enable = true;
#                 lifetimeElisionHints.enable = "always";
#                 rangeExclusiveHints.enable = true;
#               };
#
#               procMacro = {
#                 enable = true;
#               };
#
#               rustc.source = "discover";
#             };
#           };
#         };
#       };
#     };
#   };
# }
