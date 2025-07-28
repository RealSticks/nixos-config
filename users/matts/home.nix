{ config, pkgs, inputs, ... }: {

  imports = [
    ./hyprland.nix
  ];
  
  home.username = "matts";
  home.homeDirectory = "/home/matts";

  home.stateVersion = "25.05"; # Please read the comment before changing.
  
  # catppuccin.flavor = "mocha";
  # catppuccin.enable = true;

  programs.git = {
    enable = true;
    userName = "sticks";
    userEmail = "msdev.git@pm.me";
    # aliases = {
    #   pu = "push";
    #   co = "checkout";
    #   cm = "commit";
    # };
  };

  # programs.neovim = {
  #   enable = true;
  #   defaultEditor = true;
  #   viAlias = true;
  #   vimAlias = true;
  #   vimdiffAlias = true;
  #   plugins = with pkgs.vimPlugins; [
  #     nvim-lspconfig
  #     nvim-treesitter.withAllGrammars
  #   ];
  #   extraLuaConfig = ''
  #     ${builtins.readFile ../../modules/neovim/options.lua}
  #   '';
  # };

  programs.kitty = {
    enable = true;
  };

  programs.firefox = {
    enable = true;
  };

  programs.yazi = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
  };

  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos_small";
        padding = {
          right = 1;
        };
      };
    };
  };

  home.packages = [
    pkgs.hello
    pkgs.protonmail-desktop
    pkgs.proton-pass
    pkgs.caligula
  ];

  home.file = {
  
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
