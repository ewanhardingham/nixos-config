{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ../../modules/home-manager/git
    ../../modules/home-manager/nvim
    ../../modules/home-manager/shell
    ../../modules/home-manager/ssh
    ../../modules/home-manager/tmux
    ../../modules/home-manager/variables/theme
  ];

  home.username = "ewan";
  home.homeDirectory = "/home/ewan";

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  home.file = {
  };

  home.sessionVariables = {
    NIXPKGS_ALLOW_INSECURE = "1";
    EDITOR = "nvim";
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}

