{
  description = "nix-configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins.url = "github:hyprwm/hyprland-plugins";
    hyprland-plugins.inputs.hyprland.follows = "hyprland";
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; config.allowUnfree = true;};
    globalModules = [
      {
        system.configurationRevision = self.rev or self.dirtyRev or null;
      }
      ./modules/global/global.nix
    ];
    globalModulesNixos = globalModules ++ [
      ./modules/global/nixos.nix
      home-manager.nixosModules.default
    ];
  in
  {
    nixosConfigurations = {
      luna = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system; };
        modules = globalModulesNixos ++ [
	  ./hosts/luna/configuration.nix
	  nixos-hardware.nixosModules.framework-13-7040-amd
        ];
      };
    };
  };
}
