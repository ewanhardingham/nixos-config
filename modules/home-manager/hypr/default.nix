{ inputs, pkgs, ... }:
{

  imports = [ ./hyprpaper.nix ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;

    settings = {

      env = [ "XCURSOR_SIZE, 24" ];
      exec-once = [
        "${pkgs.hyprpaper}/bin/hyprpaper"
        "hyprctl setcursor Qogir 24"
	"mako"
	"hyprpaper"
	"wl-paste --type text --watch cliphist store"
	"wl-paste --type image --watch cliphist store"
      ];

      monitor = [
        "DP-1,3840x2160@240,auto,1.5"
        "HDMI-A-1,3840x2160@120,auto,1"
      ];

      general = {
        layout = "dwindle";
        resize_on_border = true;
        no_cursor_warps = true;
      };

      misc = {
        disable_splash_rendering = true;
        force_default_wallpaper = 1;
	vrr = 2; # variable refresh rate (freesync) in fullscreen modes
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = "yes";
          disable_while_typing = true;
          drag_lock = true;
        };
        sensitivity = 0;
        float_switch_override_focus = 2;
      };

      binds = {
        allow_workspace_cycles = true;
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_forever = true;
        workspace_swipe_numbered = true;
      };

      windowrule = let
        f = regex: "float, ^(${regex})$";
      in [
        #(f "org.gnome.Calculator")
        #(f "org.gnome.Nautilus")
        #(f "pavucontrol")
        #(f "nm-connection-editor")
        #(f "blueberry.py")
        #(f "org.gnome.Settings")
        #(f "org.gnome.design.Palette")
        #(f "Color Picker")
        #(f "xdg-desktop-portal")
        #(f "xdg-desktop-portal-gnome")
        #(f "transmission-gtk")
        #(f "com.github.Aylur.ags")
        #"workspace 7, title:Spotify"
      ];

      bind = let
        binding = mod: cmd: key: arg: "${mod}, ${key}, ${cmd}, ${arg}";
        mvfocus = binding "SUPER" "movefocus";
        ws = binding "SUPER" "workspace";
        resizeactive = binding "SUPER CTRL" "resizeactive";
        mvactive = binding "SUPER ALT" "moveactive";
        mvtows = binding "SUPER SHIFT" "movetoworkspace";
        e = "exec, ags -b hypr";
        arr = [1 2 3 4 5 6 7 8 9];
      in [
        #"CTRL SHIFT, R,  ${e} quit; ags -b hypr"
        #"SUPER, R,       ${e} -t launcher"
        #"SUPER, Tab,     ${e} -t overview"
        #",XF86PowerOff,  ${e} -r 'powermenu.shutdown()'"
        #",XF86Launch4,   ${e} -r 'recorder.start()'"
        #",Print,         ${e} -r 'recorder.screenshot()'"
        #"SHIFT,Print,    ${e} -r 'recorder.screenshot(true)'"
	"SUPER, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
        "SUPER, Return, exec, alacritty"
        "SUPER, W, exec, firefox"
	"SUPER, Space, exec, rofi -show drun"
	",XF86AudioRaiseVolume, exec, pamixer -i 5"
	",XF86AudioLowerVolume, exec, pamixer -d 5"
	"CTRL ALT, L, exec, hyprctl keyword monitor 'DP-1, 3840x2160@240, auto, 1.5'" 
	"CTRL ALT, M, exec, hyprctl keyword monitor 'DP-1, 3840x2160@240, auto, 1'"
        "SUPER, P, exec, hyprshot -m window"
        "SUPER SHIFT, P, exec, hyprshot -m region"


        "ALT, Tab, focuscurrentorlast"
        "CTRL ALT, Delete, exit"
        "ALT, Q, killactive"
        "SUPER, F, togglefloating"
        "SUPER, G, fullscreen"
        "SUPER, O, fakefullscreen"
        "SUPER, P, togglesplit"

        (mvfocus "k" "u")
        (mvfocus "j" "d")
        (mvfocus "l" "r")
        (mvfocus "h" "l")
        (ws "left" "e-1")
        (ws "right" "e+1")
        (mvtows "left" "e-1")
        (mvtows "right" "e+1")
        (resizeactive "k" "0 -20")
        (resizeactive "j" "0 20")
        (resizeactive "l" "20 0")
        (resizeactive "h" "-20 0")
        (mvactive "k" "0 -20")
        (mvactive "j" "0 20")
        (mvactive "l" "20 0")
        (mvactive "h" "-20 0")
      ]
      ++ (map (i: ws (toString i) (toString i)) arr)
      ++ (map (i: mvtows (toString i) (toString i)) arr);

      bindm = [
        "SUPER, mouse:273, resizewindow"
        "SUPER, mouse:272, movewindow"
      ];

      decoration = {
        drop_shadow = "yes";
        shadow_range = 8;
        shadow_render_power = 2;
        "col.shadow" = "rgba(00000044)";

        dim_inactive = false;

        blur = {
          enabled = true;
          size = 8;
          passes = 3;
          new_optimizations = "on";
          noise = 0.01;
          contrast = 0.9;
          brightness = 0.8;
          popups = true;
        };
      };

      animations = {
        enabled = "yes";
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 5, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      plugin = {
        hyprbars = {
          bar_color = "rgb(2a2a2a)";
          bar_height = 28;
          col_text = "rgba(ffffffdd)";
          bar_text_size = 11;
          bar_text_font = "JetBrainsMono";

          buttons = {
            button_size = 0;
            "col.maximize" = "rgba(ffffff11)";
            "col.close" = "rgba(ff111133)";
          };
        };
      };
    };
  };
}
