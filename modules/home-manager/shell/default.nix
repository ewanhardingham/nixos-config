{ ... }:

{
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
    nixflaker = "sudo nixos-rebuild switch --flake ~/nixos#default";
    nixflakeu = "nix flake update && sudo nixos-rebuild switch --flake ~/nixos#default";
  };
}

