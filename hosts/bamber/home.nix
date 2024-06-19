{ pkgs, ... }:

{

  imports = [ 
    ../../modules/home-manager/alacritty
    ../../modules/home-manager/git
    ../../modules/home-manager/nvim
    ../../modules/home-manager/shell
    ../../modules/home-manager/ssh
  ];

  home.username = "ewan";
  home.homeDirectory = "/Users/ewan";
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ripgrep
    nixfmt
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
