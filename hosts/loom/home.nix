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
    EDITOR = "nvim";
    NIXPKGS_ALLOW_UNFREE = "1";
  };

  programs.home-manager.enable = true;
  programs.mangohud = {
    enable = true;
    settings.full = true;
  };

}
