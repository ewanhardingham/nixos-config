{ config, pkgs, lib, inputs, ... }:

{

  imports = [
    ../../modules/home-manager/alacritty
    ../../modules/home-manager/git
    ../../modules/home-manager/hypr
    ../../modules/home-manager/nvim
    ../../modules/home-manager/shell
    ../../modules/home-manager/ssh
    ../../modules/home-manager/waybar
  ];


  programs.rofi.enable = true;
  programs.btop = {
    enable = true;
  };

  home.username = "ewan";
  home.homeDirectory = "/home/ewan";

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    firefox
    ripgrep
    neofetch
    mako # notifs
    hyprpaper # wallpaper
    cliphist # clipboard manager
    discord
  ];

  home.file = {
    
  };

  home.sessionVariables = {
     NIXPKGS_ALLOW_INSECURE = "1";
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

}
