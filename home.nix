{ config, pkgs, lib, inputs, ... }:

{

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
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
  ];

  home.file = {
    
  };

  home.sessionVariables = {
    
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

}
