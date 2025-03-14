{
  colorschemes = {
    onedark = {
      enable = true;
      settings = {
        style = "dark";
        toggle_style_list = [
          "dark"
          "darker"
          "cool"
          "deep"
          "warm"
          "warmer"
          "light"
        ];
        toggle_style_key = "<leader>ts"; # keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
        # background = "dark";
        contrast = "hard"; # can be "hard","medium" or "soft"
        term_colors = true;
        ending_tildes = true;
        transparent_mode = false;
        undercurl = true;
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
