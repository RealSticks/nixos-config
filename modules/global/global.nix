{ inputs, pkgs, lib, ... }: {

  imports = [
    ../../users/matts/user.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    neovim
  ];

  # Set the default editor to neovim
  environment.variables.EDITOR = "neovim";

}
