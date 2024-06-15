{config, pkgs, ...}:
{
  programs.alacritty.enable = true;
  
  programs.alacritty.settings = {
    window = { 
      padding = { x = 10; y = 10; };
      opacity = 0.66;
      blur = true;
#      decorations = "Buttonless";
    }; 

    scrolling = {
      history = 10000; 
      multiplier = 3;
    };
    
    colors = {
      primary = {
        #background = "#0A0E14";
        background = "#000000";
	foreground = "#B3B1AD";
      };
      normal = {
        black   = "#01060E";
        red     = "#EA6C73";
        green   = "#91B362";
        yellow  = "#F9AF4F";
        blue    = "#53BDFA";
        magenta = "#FAE994";
        cyan    = "#90E1C6";
        white   = "#C7C7C7";
      };
      bright = {
        black   = "#686868";
	red     = "#F07178";
	green   = "#C2D94C";
	yellow  = "#FFB454";
	blue    = "#59C2FF";
	magenta = "#FFEE99";
	cyan    = "#95E6CB";
	white   = "#FFFFFF";
      };
    };

    font = {
      normal = {
        family = "JetBrainsMono Nerd Font"; 
        style = "Medium";
      };
      italic = {
        family = "JetBrainsMono Nerd Font"; 
        style = "Medium Italic";
      };
      bold = {
        family = "JetBrainsMono Nerd Font"; 
        style = "Bold";
      };
      bold_italic = {
        family = "JetBrainsMono Nerd Font"; 
        style = "Bold Italic";
      };
      size = 16;
    };

    keyboard.bindings = [
      { 
        key = "O"; 
        mods = "Control"; 
        action = "ScrollHalfPageUp"; 
      }
      { 
        key = "P"; 
        mods = "Control"; 
        action = "ScrollHalfPageDown"; 
      }
      {   
        key = "Equals"; 
        mods = "Control"; 
        action = "IncreaseFontSize"; 
      }
      { 
        key = "Plus"; 
        mods = "Control"; 
        action = "IncreaseFontSize"; 
      }
      { 
        key = "Minus"; 
        mods = "Control"; 
        action = "DecreaseFontSize"; 
      }
    ];
    live_config_reload = true;
  };
}
