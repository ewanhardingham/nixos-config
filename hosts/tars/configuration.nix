{ pkgs, ... }: {


  imports = [ 
    ../../modules/nixos/yabai
    ../../modules/nixos/skhd
  ];

  environment.systemPackages = [ pkgs.vim pkgs.jq ];

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
    };

    taps = [ "homebrew/services" "homebrew/cask-versions" ];

    brews = [ "wget" "aiven-client" ];


    casks = [
      "1password"
      "raycast"
      "firefox"
      "google-chrome"
      "docker"
      "shureplus-motiv"
      "obsidian"
      "parsec"
      "intellij-idea"
    ];
  };

  # Add ability to used TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;

  # Temp
  fonts.fontDir.enable = true;

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true; # default shell on catalina
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
