{ config, pkgs, ... }:

{

  imports = [ 
    ../../modules/home-manager/alacritty
    ../../modules/home-manager/nvim
    ../../modules/home-manager/shell
  ];

  home.username = "ewan.hardingham";
  home.homeDirectory = "/Users/ewan.hardingham";
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ripgrep
    nixfmt
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    NIXPKGS_ALLOW_INSECURE = "1";
  };

  programs.home-manager.enable = true;
}
