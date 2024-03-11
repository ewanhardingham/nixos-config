{ config, pkgs, lib, inputs, ... }:

{

  imports = [
    ../../modules/home-manager/alacritty
    ../../modules/home-manager/git
    ../../modules/home-manager/nvim
    ../../modules/home-manager/shell
    ../../modules/home-manager/ssh
  ];

  home.username = "ewan";
  home.homeDirectory = "/home/ewan";

  home.packages = with pkgs; [
    firefox
    ripgrep
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    dolphin
    wofi
  ];

  home.file = {
    
  };

  home.sessionVariables = {
    
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

}
