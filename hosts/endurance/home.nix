{ config, pkgs, ... }:

{

  imports = [ 
    ../../modules/home-manager/alacritty
    ../../modules/home-manager/git
    ../../modules/home-manager/shell
    ../../modules/home-manager/ssh
  ];

  home.username = "ewan";
  home.homeDirectory = "/Users/ewan";
  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
