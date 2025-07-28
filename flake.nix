{
  description = "nix-configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nvf.url = "github:notashelf/nvf";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, nvf, ... }@inputs:
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
    inputs.stylix.nixosModules.stylix
    nvf.nixosModules.default
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
