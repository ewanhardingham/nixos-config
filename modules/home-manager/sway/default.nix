{ pkgs, ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    config = {
      terminal = "alacritty";
      bars = [
        {
	  command = "waybar";
	  position = "top";
	}
      ];
      output = {
        DP-2 = {
	  scale = "2";
	};
      };
    };
  };
}
