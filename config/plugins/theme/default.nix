{
  colorschemes = {
    gruvbox = {
      enable = true;
      settings = {
        background = {
          light = "light";
          # dark = "dark";
        };
        contrast = "soft"; # can be "hard", "soft" or empty string
        terminal_colors = true;
        transparent_mode = true;
        undercurl = true;
        bold = false;
        integrations = {
          cmp = true;
          flash = true;
          fidget = true;
          gitsigns = true;
          indent_blankline.enabled = true;
          lsp_trouble = true;
          mini.enabled = true;
          neotree = true;
          noice = true;
          notify = true;
          telescope.enabled = true;
          treesitter = true;
          treesitter_context = true;
          which_key = true;
          native_lsp = {
            enabled = true;
            inlay_hints = {
              background = true;
            };
            virtual_text = {
              errors = [ "italic" ];
              hints = [ "italic" ];
              information = [ "italic" ];
              warnings = [ "italic" ];
              ok = [ "italic" ];
            };
            underlines = {
              errors = [ "underline" ];
              hints = [ "underline" ];
              information = [ "underline" ];
              warnings = [ "underline" ];
            };
          };
        };
      };
    };
  };
}

#
# {
#   colorschemes = {
#     gruvbox = {
#       enable = true;
#       settings = {
#         background = {
#           light = "lotus";
#           dark = "wave";
#         };
#         colors = {
#           palette = { };
#           theme = {
#             wave = { };
#             lotus = { };
#             dragon = { };
#             all = { };
#           };
#         };
#         terminal_colors = true;
#         transparent_background = true;
#         undercurl = true;
#         integrations = {
#           cmp = true;
#           flash = true;
#           fidget = true;
#           gitsigns = true;
#           indent_blankline.enabled = true;
#           lsp_trouble = true;
#           mini.enabled = true;
#           neotree = true;
#           noice = true;
#           notify = true;
#           telescope.enabled = true;
#           treesitter = true;
#           treesitter_context = true;
#           which_key = true;
#           native_lsp = {
#             enabled = true;
#             inlay_hints = {
#               background = true;
#             };
#             virtual_text = {
#               errors = [ "italic" ];
#               hints = [ "italic" ];
#               information = [ "italic" ];
#               warnings = [ "italic" ];
#               ok = [ "italic" ];
#             };
#             underlines = {
#               errors = [ "underline" ];
#               hints = [ "underline" ];
#               information = [ "underline" ];
#               warnings = [ "underline" ];
#             };
#           };
#         };
#       };
#     };
#   };
# }
