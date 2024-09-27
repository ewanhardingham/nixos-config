{ pkgs, ... }:

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
    (google-cloud-sdk.withExtraComponents[ google-cloud-sdk.components.gke-gcloud-auth-plugin google-cloud-sdk.components.docker-credential-gcr ])
    spotify
    slides
    vscode
    tenv
    moonlight-qt
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    NIXPKGS_ALLOW_UNFREE = "1";
  };

  home.shellAliases = {
    rtars = "darwin-rebuild switch --flake .#tars";
    htars = "home-manager switch --flake .#ewan.hardingham@tars --impure";
  };

  programs.home-manager.enable = true;
}
