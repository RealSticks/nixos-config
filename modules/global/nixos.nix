{ pkgs, lib, inputs, ... }: {

  environment.systemPackages = with pkgs; [
    
  ];
  
  programs.nvf = {
    enable = true;
    settings = {
      vim.viAlias = false;
      vim.vimAlias = true;
      vim.lsp = {
        enable = true;
      };
    };
  };

  qt = {
    enable = lib.mkDefault true;
  };

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    cursor = {
      package = pkgs.rose-pine-hyprcursor;
      # package = pkgs.posy-cursors;
      # name = "Posy-Cursor";
      name = "BreezX-RosePine-Linux";
      size = 24;
    };
  };
}
