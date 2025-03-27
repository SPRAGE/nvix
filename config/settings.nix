{
  config = {
    extraConfigLuaPre = ''
      vim.fn.sign_define("diagnosticsignerror", { text = " ", texthl = "diagnosticerror", linehl = "", numhl = "" })
      vim.fn.sign_define("diagnosticsignwarn", { text = " ", texthl = "diagnosticwarn", linehl = "", numhl = "" })
      vim.fn.sign_define("diagnosticsignhint", { text = "󰌵", texthl = "diagnostichint", linehl = "", numhl = "" })
      vim.fn.sign_define("diagnosticsigninfo", { text = " ", texthl = "diagnosticinfo", linehl = "", numhl = "" })
    '';

    luaLoader.enable = true;

    # Only this is valid if you're using Wayland GUI clipboard
    clipboard.providers.wl-copy.enable = true;

    opts = {
      virtualedit = "block";
      cursorline = true;
      cmdheight = 2;
      showmode = false;
      number = true;
      relativenumber = true;
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      smartindent = true;
      wrap = true;
      breakindent = true;
      swapfile = false;
      backup = false;
      undofile = true;
      hlsearch = true;
      incsearch = true;
      splitbelow = true;
      splitright = true;
      ignorecase = true;
      smartcase = true;
      grepprg = "rg --vimgrep";
      grepformat = "%f:%l:%c:%m";
      termguicolors = true;
      updatetime = 50;
      signcolumn = "yes";
      timeoutlen = 250;
      scrolloff = 8;
      mouse = "a";
      encoding = "utf-8";
      fileencoding = "utf-8";
      pumheight = 0;
    };

    extraConfigLua = ''
      local g = vim.g
      local o = vim.o

      -- Set clipboard to use OSC52 explicitly
      -- g.clipboard = {
      --   name = 'osc52',
      --   copy = {
      --     ['+'] = function(str) require('vim.ui.clipboard.osc52').copy(str) end,
      --     ['*'] = function(str) require('vim.ui.clipboard.osc52').copy(str) end,
      --   },
      --   paste = {
      --     ['+'] = function() return require('vim.ui.clipboard.osc52').paste() end,
      --     ['*'] = function() return require('vim.ui.clipboard.osc52').paste() end,
      --   },
      -- }
      --
      -- Optional: auto-yank to clipboard on TextYankPost
      vim.api.nvim_create_autocmd("TextYankPost", {
        callback = function()
          if vim.v.event.operator == "y" and vim.v.event.regname == "" then
            require("vim.ui.clipboard.osc52").copy(vim.fn.getreg('"'))
          end
        end
      })

      -- Neovide config
      if g.neovide then
        g.neovide_fullscreen = false
        g.neovide_hide_mouse_when_typing = false
        g.neovide_refresh_rate = 165
        g.neovide_cursor_vfx_mode = "ripple"
        g.neovide_cursor_animate_command_line = true
        g.neovide_cursor_animate_in_insert_mode = true
        g.neovide_cursor_vfx_particle_lifetime = 5.0
        g.neovide_cursor_vfx_particle_density = 14.0
        g.neovide_cursor_vfx_particle_speed = 12.0
        g.neovide_transparency = 0.8
        o.guifont = "MonoLisa Trial:Medium:h15"
      end
    '';
  };
}
