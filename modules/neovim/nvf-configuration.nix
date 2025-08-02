{ inputs, pkgs, lib, ... }: {
  
  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;

        diagnostics = {
          enable = true;
          config = {
            virtual_lines = true;
          };
        };

        lsp = {
          enable = true;
        };

        languages = {
          rust.enable = true;
          rust.lsp.enable = true;
          nix.enable = true;
          nix.lsp.enable = true;
          lua.enable = true;
          lua.lsp.enable = true;
        };

        autocomplete.blink-cmp = {
          enable = true;
        };

        options = {
          shiftwidth = 2;
          tabstop = 2;
          wrap = false;
        };

        additionalRuntimePaths = [
          ./nvim
        ];

        # Neovim supports in-line syntax highlighting for multi-line strings.
        # Simply place the filetype in a /* comment */ before the line.
        luaConfigRC.myconfig = /* lua */ ''
          -- Call the Lua module from ./nvim/lua/myconfig
          -- require('myconfig')

          vim.g.mapleader = ' '
          vim.g.maplocalleader = '/'

          vim.opt.number = true
          vim.opt.relativenumber = true

          vim.opt.expandtab = true
          vim.opt.autoindent = true
          -- Any additional Lua configuration that you might want *after* your own
          -- configuration. For example, a plugin setup call.
          -- require('gitsigns').setup({})
          '';
      };
    };
  };
}
