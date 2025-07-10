{ inputs, config, pkgs, ... }: {

  imports = [
    inputs.home-manager.nixosModules.default
  ];

  users.users.matts = {
    isNormalUser = true;
    description = "Matthew Stickells";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      matts = import ./home.nix;
    };
  };
}
