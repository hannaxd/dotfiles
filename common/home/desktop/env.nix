{ pkgs, ... }: {
  services.mako = {
    enable = true;

    anchor = "top-right";
    defaultTimeout = 5000;
  };

  services.poweralertd.enable = true;

  qt = {
    enable = true;

    platformTheme = "gtk";
  };

  gtk = {
    enable = true;

    # Catppuccin GTK Mod
    theme = {
      name = "Catppuccin-Mocha-Compact-Red-Dark"; # lmao
      package = pkgs.catppuccin-gtk.override {
        accents = [ "red" ];
        size = "compact";
        tweaks = [ "rimless" "black" ];
        variant = "mocha";
      };
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Numix-Cursor";
      package = pkgs.numix-cursor-theme;
    };

    gtk3.extraConfig = {
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";

      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = { gtk-application-prefer-dark-theme = 1; };

    gtk2.extraConfig = ''
      gtk-xft-antialias=1
      gtk-xft-hinting=1
      gtk-xft-hintstyle="hintslight"
      gtk-xft-rgba="rgb"
    '';
  };

  home.sessionVariables.GTK_THEME = "Catppuccin-Mocha-Compact-Red-Dark";
}
