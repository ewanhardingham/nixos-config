{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.sunshine
    pkgs.moonlight-qt # for testing purposes.
  ];
  services.udev.packages = [ pkgs.sunshine ];
  # Needed for network discovery
  services.avahi.enable = true;
  services.avahi.publish.enable = true;
  services.avahi.publish.userServices = true;
  services.sunshine = {
    enable = true;
    autoStart = true;
    openFirewall = true;
    capSysAdmin = true;
  };
}
