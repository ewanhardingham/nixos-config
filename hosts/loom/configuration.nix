{ pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/nixos/sunshine
    ];

  # Boot Settings
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.kernelModules = [ "amdgpu" ];

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "ewan";
  services.desktopManager.plasma6.enable = true;

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;


  # Networking
  networking.hostName = "loom";
  networking.networkmanager.enable = true;

  # Locale
  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };
  console.keyMap = "uk";

  # Services & Hardware
  services = {
    printing.enable = true;
    openssh.enable = true;
    blueman.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
  sound.enable = true;
  security.rtkit.enable = true;
  security.polkit.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.bluetooth.enable = true;
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # User Management
  users.users.ewan = {
    isNormalUser = true;
    description = "Ewan Hardingham";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # System-level programs
  nixpkgs.config.allowUnfree = true;
  programs.zsh.enable = true;
  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [
    firefox # browser
    vim # editor
    wget # network dl
    git # source control
    wl-clipboard # clipboard history
    blueberry # bluetooth gui
    ripgrep # system util
    neofetch # system info
    unzip 
  ]; 

  # Shell
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Nix
  nix.settings.experimental-features = [ "nix-command" "flakes" ];  
  system.stateVersion = "23.11"; # Did you read the comment?

}
