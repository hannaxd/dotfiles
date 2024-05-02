{ pkgs, lib, inputs, desktopWallpaper, desktopWallpaperVert, ... }:
let
  wall = /. + desktopWallpaper;
  vertWall = /. + desktopWallpaperVert;
in {
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    ipc = off
    splash = off
    preload = ${wall}
    preload = ${vertWall}
    wallpaper = DP-1,${wall}
    wallpaper = HDMI-A-2,${vertWall}
  '';

  home.packages = [ inputs.hyprland-contrib.packages.${pkgs.system}.grimblast ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    extraConfig = ''
      monitor = DP-1,1920x1080@144,0x420,1
      monitor = HDMI-A-2,1920x1080,1920x0,1,transform,1

      exec-once = hyprpaper &
      exec-once = systemctl --user import-environment
      exec-once = xrandr --output DP-1 --primary

      env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
      env = XCURSOR_SIZE,16

      input {
        kb_layout = us
        follow_mouse = 1

        touchpad {
            natural_scroll = no
        }
      }

      general {
        gaps_in = 5
        gaps_out = 20

        border_size = 2

        col.active_border = rgba(f7768eee)
        col.inactive_border = rgba(000000aa)

        layout = dwindle
      }

      decoration {
        rounding = 6

        dim_inactive = false

        blur {
            enabled = 1
            size = 5
            passes = 3
        }

        drop_shadow = false
        shadow_range = 4
        shadow_render_power = 3

        col.shadow = rgba(1a1a1aee)

        inactive_opacity = 1
      }

      animations {
        enabled = true

        # █▄▄ █▀▀ ▀█ █ █▀▀ █▀█   █▀▀ █░█ █▀█ █░█ █▀▀
        # █▄█ ██▄ █▄ █ ██▄ █▀▄   █▄▄ █▄█ █▀▄ ▀▄▀ ██▄

        bezier = overshot, 0.05, 0.9, 0.1, 1.05
        bezier = smoothIn, 0.25, 1, 0.5, 1
        bezier = smoothOut, 0.36, 0, 0.66, -.56

        animation = windows, 1, 5, overshot, slide
        animation = windowsOut, 1, 4, smoothOut, slide
        animation = windowsMove, 1, 4, default

        animation = border, 1, 10, default

        animation = fade, 1, 10, smoothIn
        animation = fadeDim, 1, 10, smoothIn

        animation = workspaces, 1, 6, default
      }

      dwindle {
        pseudotile = yes
        preserve_split = yes
      }

      # Window Rules
      windowrule = float, file_progress
      windowrule = float, Rofi
      windowrule = float, pavucontrol
      windowrule = float, pavucontrol-qt
      windowrule = float, confirm
      windowrule = float, dialog
      windowrule = float, download
      windowrule = float, notification
      windowrule = float, error
      windowrule = float, splash
      windowrule = float, confirmreset
      windowrule = float, title: Open File
      windowrule = float, title:branchdialog
      windowrule = float, Lxappearance
      windowrule = float, viewnior
      windowrule = float, feh
      windowrule = float, foot

      windowrule = opacity 1.0 override 1.0 override,^(LibreWolf)$
      windowrule = opacity 1.0 override 1.0 override,^(librewolf)$
      windowrule = opacity 1.0 override 1.0 override,^(discord)$
      windowrule = opacity 1.0 override 1.0 override,^(mpv)$

      windowrule = opacity 0.90 override 0.90 override,^(Code)$
      windowrule = opacity 0.90 override 0.90 override,^(VSCode)$
      windowrule = opacity 0.90 override 0.90 override,^(code-url-handler)$

      workspace = 1, monitor:DP-1, default: true
      workspace = 2, monitor:DP-1
      workspace = 3, monitor:DP-1
      workspace = 4, monitor:DP-1
      workspace = 5, monitor:DP-1

      workspace = 6, monitor:HDMI-A-2, default: true
      workspace = 7, monitor:HDMI-A-2

      layerrule = blur, waybar

      # Keybinds
      $mainMod = SUPER

      bind = $mainMod, Return, exec, foot
      bind = $mainMod, E, exec, thunar
      bind = $mainMod, R, exec, bemenu-run -p "run: "
      bind = $mainMod, X, exec, grimblast copy area
      bind = $mainMod, A, exec, grimblast copy active
      bind = $mainMod SHIFT, X, exec, hyprpicker -a -n

      bind = $mainMod, C, killactive
      bind = $mainMod, V, togglefloating
      bind = $mainMod, P, pseudo
      bind = $mainMod, J, togglesplit
      bind = $mainMod, F, fullscreen

      bind = CTRL ALT SHIFT, Q, exit
      bind = CTRL ALT SHIFT, S, exec, systemctl poweroff
      bind = CTRL ALT SHIFT, R, exec, systemctl reboot

      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d

      ${builtins.concatStringsSep "" (builtins.genList (x:
        let ws = toString (x + 1);
        in ''
          bind = $mainMod, ${ws}, workspace, ${ws}
          bind = SUPER SHIFT, ${ws}, movetoworkspace, ${ws}
        '') 9)}

      bind = $mainMod, mouse_up, workspace, e+1
      bind = $mainMod, mouse_down, workspace, e-1

      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow

      bind = ,XF86AudioPlay, exec, playerctl play-pause
      bind = ,XF86AudioMedia, exec, playerctl play-pause
      bind = ,XF86AudioPrev, exec, playerctl previous
      bind = ,XF86AudioNext, exec, playerctl next
      bind = ,XF86AudioStop, exec, playerctl stop

      bind = ,XF86MonBrightnessUp, exec, brightnessctl set +10%
      bind = ,XF86MonBrightnessDown, exec, brightnessctl set 10%-
    '';
  };

  systemd.user.services.swayidle.Install.WantedBy =
    lib.mkForce [ "graphical-session.target" ];

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;

    settings = {
      effect-blur = "20x3";
      fade-in = 0.5;
    };
  };
}
