{ pkgs, inputs, ... }: {
  systemd.services = {
    seatd = {
      enable = true;
      description = "Seat managemment daemon - Wayland";
      script = "${pkgs.seatd}/bin/seatd -g wheel";
      serviceConfig = {
        Type = "simple";
        Restart = "always";
        RestartSec = "1";
      };
      wantedBy = [ "multi-user.target" ];
    };

    systemd-journal-flush.enable = true;

    kanshi = {
      description = "kanshi daemon - monitor hotswap";
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.kanshi}/bin/kanshi -c kanshi_config_file";
      };
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  services = {
    dbus = {
      enable = true;
      packages = with pkgs; [ dconf udisks2 gcr ];
      implementation = "broker";
    };

    udisks2.enable = true;

    journald.extraConfig = ''
      SystemMaxUse=50M
      RuntimeMaxUse=10M
    '';

    gvfs.enable = true;
    tumbler.enable = true;
    atd.enable = true;
    fstrim.enable = true;
    blueman.enable = true; # bluetooth

    gnome.gnome-keyring.enable = true;
  };
}
