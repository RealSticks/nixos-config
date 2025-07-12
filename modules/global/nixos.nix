{ pkgs, lib, ... }: {

  environment.systemPackages = with pkgs; [
    
  ];
  
  qt = {
    enable = lib.mkDefault true;
  };

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  };
}
