{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
	height = 30;
	modules-left = [ "hyprland/workspaces" "hyprland/submap" ];
	modules-center = [ "hyprland/window" ];
	modules-right = [ "tray" "network" "clock#date" "clock#time" ];
	
	"clock#time" = {
	  interval = 1;
	  format = "{:%H:%M:%S}";
	  tooltip = false;
	};

	"clock#date" = {
	  interval = 10;
          format = "  {:%e %b %Y}";
	  tooltip-format = "{:%e %B %Y}";
	};

	cpu = {
          interval = 5;
          format = "  {usage}% ({load})";
          states = {
            warning = 70;
            critical = 90;
          };
        };

	"custom/keyboard-layout" = {
          exec = "swaymsg -t get_inputs | grep -m1 'xkb_active_layout_name' | cut -d '\"' -f4";
          interval = 30;
          format = "  {}";
          signal = 1;
          tooltip = false;
	};

	memory = {
          interval = 5;
          format = "  {}%";
          states = {
            warning = 70;
            critical = 90;
          };
        };

	network = {
          interval = 5;
          format-wifi = "  ({signalStrength}%)";
          format-ethernet = "";
          format-disconnected = "⚠  Disconnected";
          tooltip-format = "{ifname}: {ipaddr}";
        };

	"hyprland/submap" = {
	  format = "<span style=\"italic\">  {}</span>";
          tooltip = false;
	};

        "hyprland/window" = {
          format = "{}";
          max-length = 120;
	};

        "hyprland/workspaces" = {
          all-outputs = false;
          disable-scroll = true;
          format = "{icon} {name}";
          format-icons = {
            "1" = "";
            "default" = "";
           };
         };

         pulseaudio = {
           scroll-step = 1;
           format = "{icon}  {volume}%";
           format-bluetooth = "{icon}  {volume}%";
           format-muted = "";
           format-icons = {
              headphones = "";
              handsfree = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = ["" ""];
           };
           on-click = "pavucontrol";
         };

         temperature = {
           critical-threshold = 80;
           interval = 5;
           format = "{icon}  {temperatureC}°C";
           format-icons = [
             "" 
             ""
             ""
             ""
             ""
           ];
           tooltip = true;
         };

         tray = {
           icon-size = 21;
           spacing = 10;
         };

	 battery = {
           interval = 10;
           states = {
             warning = 30;
             critical = 15;
           };
           format = "  {icon}  {capacity}%";
           format-discharging = "{icon}  {capacity}%";
           format-icons = [
             ""
             ""
             ""
             ""
             ""
           ];
           tooltip = true;
	 };
       };
     };
    
    style = builtins.readFile ../../../.configs/waybar/style-2.css;
  };
}
