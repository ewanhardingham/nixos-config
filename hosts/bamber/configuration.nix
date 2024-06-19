{ pkgs, ... }: {


  imports = [ 
  ];

  environment.systemPackages = [ pkgs.vim pkgs.jq ];

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
    };

    taps = [ "homebrew/services" ];

    brews = [ "wget" ];


    casks = [
      "1password"
      "raycast"
    ];
  };

  programs.zsh.enable = true; # default shell on catalina

  services.nix-daemon.enable = true;
  nix.settings.experimental-features = "nix-command flakes";
  system.stateVersion = 4;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
