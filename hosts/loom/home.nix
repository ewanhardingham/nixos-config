{ config, pkgs, lib, inputs, ... }:

{

  imports = [
    ../../modules/home-manager/alacritty
    ../../modules/home-manager/git
    ../../modules/home-manager/hypr
    ../../modules/home-manager/nvim
    ../../modules/home-manager/shell
    ../../modules/home-manager/ssh
    ../../modules/home-manager/variables/theme
    ../../modules/home-manager/waybar
    ../../modules/home-manager/wallpaper
  ];


  programs.rofi.enable = true;
  programs.btop = {
    enable = true;
  };
  programs.mangohud = {
    enable = true;
    settings.full = true;
  };

  home.username = "ewan";
  home.homeDirectory = "/home/ewan";

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    mako # notifs
    pamixer # sound mixer
    hyprpaper # wallpaper
    cliphist # clipboard manager
    discord # chat
    lutris # game launcher
    gamemode # game optimizer
    gamescope # res override
    _1password-gui # password manager
  ];

  home.file = {
    
  };

  home.sessionVariables = {
     NIXPKGS_ALLOW_INSECURE = "1";
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

}
