{ config, pkgs, ... }:

{

  imports = [ 
    ../../modules/home-manager/alacritty
    ../../modules/home-manager/nvim
    ../../modules/home-manager/shell
    ../../modules/home-manager/tmux
  ];

  home.username = "ewan.hardingham";
  home.homeDirectory = "/Users/ewan.hardingham";
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ripgrep
    nixfmt
    slack
    sbt
    (google-cloud-sdk.withExtraComponents([google-cloud-sdk.components.gke-gcloud-auth-plugin]))
    spotify
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    NIXPKGS_ALLOW_INSECURE = "1";
    NIXPKGS_ALLOW_UNFREE = "1";
  };

  programs.home-manager.enable = true;
}
