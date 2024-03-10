{ config, pkgs, lib, inputs, ... }:

{

  imports = [
    ./home/alacritty
    ./home/git
    ./home/nvim
    ./home/shell
    ./home/ssh
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
