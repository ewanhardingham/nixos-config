{ config, lib, pkgs, ... }:

{
  wsl.enable = true;
  wsl.defaultUser = "ewan";
  wsl.nativeSystemd = true;
  
  environment.systemPackages = with pkgs; [
    vim # editor
    wget # network dl
    git # source control
  ];

  programs.zsh.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  users.defaultUserShell = pkgs.zsh;
  
  networking.hostName = "loom";
  system.stateVersion = "23.11";
}
