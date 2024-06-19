{ pkgs, ... }:

{

  home.packages = with pkgs; [ scala-cli ];

  # zsh
  programs.zsh = {
    # enable zsh
    enable = true;
    
    # enable oh-my-zsh
    oh-my-zsh.enable = true;
    
    # enable plugins
    enableCompletion = true;
    autosuggestion.enable = true;
  };

  # starship
  programs.starship = {
    # enable starship
    enable = true;
    enableZshIntegration = true;
  };

  # shell aliases
  home.shellAliases = {
    nixclean = "nix-collect-garbage -d";
  };
}

