{ pkgs, ... }:

{

  imports = [
    ../../modules/home-manager/alacritty
    ../../modules/home-manager/git
    ../../modules/home-manager/nvim
    ../../modules/home-manager/shell
    ../../modules/home-manager/ssh
    ../../modules/home-manager/variables/theme
    ../../modules/home-manager/wallpaper
  ];

  programs.btop = {
    enable = true;
  };
  programs.mangohud = {
    enable = true;
    settings.full = true;
  };

  home.username = "ewan";
  home.homeDirectory = "/home/ewan";
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    discord # chat
    lutris # game launcher
    gamemode # game optimizer
    gamescope # res override
    _1password-gui # password manager
    hypnotix
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
  programs.mangohud = {
    enable = true;
    settings.full = true;
  };

}
