{ inputs, ... }: {
  programs.waybar = {
    enable = true;

    systemd = {
      enable = true;
      target = "graphical-session.target";
    };

    settings = [{
      layer = "top";
      position = "bottom";
      passthrough = false;
      gtk-layer-shell = true;

      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "custom/playerctl" ];
      modules-right = [ "custom/puppy" "pulseaudio" "clock" ];

      "hyprland/workspaces" = {
        format = "{name}";
        on-click = "activate";
        tooltip = false;

        format-icons = {
          default = "";
          urgent = "";
          active = "";
        };

        persistent-workspaces = {
          "DP-1" = [ 1 2 3 4 5 ];
          "HDMI-A-2" = [ 6 7 ];
        };
      };

      clock = { format = "[ <span color='#eba0ac'> </span>{:%H:%M} ]"; };

      "custom/puppy" = {
        format = "[ <span color='#f38ba8'> </span>Carrie ]";
      };

      pulseaudio = {
        on-click = "pamixer -t";

        format =
          "[ <span size='13000' foreground='#A4B9EF'>{icon}</span> {volume}% ]";
        format-muted = "[ <span size='14000'></span> ]";

        tooltip = false;
        format-icons = { default = [ "" "" "󰕾" "󰕾" "󰕾" "" "" "" ]; };
        scroll-step = 1;
        on-click-right = "pavucontrol";
      };

      "custom/playerctl" = {
        format = "{icon}  <span>{}</span>";
        return-type = "json";
        max-length = 50;

        exec = ''
          playerctl -a metadata --format '{"text": "{{artist}} ~ {{markup_escape(title)}}", "tooltip": "{{playerName}} : {{markup_escape(title)}}", "alt": "{{status}}", "class": "{{status}}"}' -F'';

        on-click = "playerctl previous";
        on-click-middle = "playerctl play-pause";
        on-click-right = "playerctl next";

        format-icons = {
          "Playing" = "<span foreground='#74c7ec'></span>";
          "Paused" = "<span foreground='#eba0ac'></span>";
        };
      };
    }];

    style = ''
      * {
        border: none;
        font-family: "Maple Mono NF", "JetBrainsMono Nerd Font, Material Icon";
        font-size: 11pt;
        font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
        min-height: 0;
      }

      window#waybar {
        background: rgba(20,20,20,0.2);
        color: #c5c9c5;
      }

      #workspaces {
        border-radius: 10px;
        color: #eba0ac;
        margin-left: 5px;
        margin-top: 1px;
        margin-bottom: 1px;
        margin-left: 15px;
      }

      #custom-playerctl {
        border-radius: 15px;
        color: #eba0ac;
        margin-top: 1px;
        margin-bottom: 1px;
        padding-left: 15px;
        padding-right: 15px;
      }

      #workspaces button {
        padding-left: 10px;
        padding-right: 5px;
        min-width: 0;
        color: #b4befe;
      }

      #workspaces button.empty {
        color: #606375;
      }

      #workspaces button.active {
        color: #eba0ac;
      }

      #workspaces button:hover {
        color: #74c7ec;
        box-shadow: none;
        text-shadow: none;
      }

      #clock,
      #pulseaudio {
        color: #c5c9c5;
        margin-top: 1px;
        margin-bottom: 1px;
        padding-left: 5px;
        padding-right: 5px;
      }

      #pulseaudio {
        border-top-right-radius: 0;
        border-bottom-right-radius: 0;
        padding-left: 5px;
      }

      #clock {
        margin-right: 15px;
        border-top-left-radius: 0;
        border-bottom-left-radius: 0;
      }

      #custom-puppy {
        margin-right: 5px;
      }
    '';
  };
}
