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
      "parsec"
      "visual-studio-code"
      "shureplus-motiv"
    ];
  };

  programs.zsh.enable = true; 

  services.nix-daemon.enable = true;
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true; 

  nix = {
    package = pkgs.nix;
    settings = {
      trusted-users = [ "@admin" "ewan" ];
      experimental-features = "nix-command flakes";
    };
    gc = {
      user = "root";
      automatic = true;
      interval = { Weekday = 0; Hour = 2; Minute = 0; };
      options = "--delete-older-than 30d";
    };
  };
  system = {
    stateVersion = 4;

    defaults = {
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        ApplePressAndHoldEnabled = false;

        # 120, 90, 60, 30, 12, 6, 2
        KeyRepeat = 2;

        # 120, 94, 68, 35, 25, 15
        InitialKeyRepeat = 15;

        "com.apple.mouse.tapBehavior" = 1;
        "com.apple.sound.beep.volume" = 0.0;
        "com.apple.sound.beep.feedback" = 0;
      };
      dock = {
        autohide = true;
	show-recents = false;
	orientation = "bottom";
	tilesize = 48;
      };
      # universalaccess.reduceMotion = true;
    };
  };
}
