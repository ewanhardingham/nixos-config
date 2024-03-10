{ config, pkgs, ... }:

{

  home.username = "ewan";
  home.homeDirectory = "/home/ewan";

  home.packages = [ ];

  home.file = {
    
  };

  home.sessionVariables = {
    
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

}
