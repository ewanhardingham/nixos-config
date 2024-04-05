{ ... }:
{
  services.skhd.enable = true;
  services.skhd.skhdConfig = builtins.readFile ./skhdrc;
}
