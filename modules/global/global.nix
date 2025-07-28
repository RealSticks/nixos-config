{ inputs, pkgs, lib, ... }: {

  imports = [
    ../../users/matts/user.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    neovim
    nixfmt-rfc-style
    nixd
  ];

  # Select internationalisation properties.
  i18n.defaultLocale = "en_AU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  # Set the default editor to neovim
  environment.variables.EDITOR = "nvim";

}
