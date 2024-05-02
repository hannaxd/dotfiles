{ config, ... }: {
  programs = {
    gpg.enable = true;
    man.enable = true;

    tealdeer = {
      enable = true;
      settings = {
        display = {
          compact = false;
          use_pager = true;
        };
        updates = { auto_update = true; };
      };
    };
  };

  xdg = {
    enable = true;
    cacheHome = config.home.homeDirectory + "/.local/cache";

    userDirs = {
      enable = true;

      download = "$HOME/down";
      pictures = "$HOME/pics";
      documents = "$HOME/docs";
      videos = "$HOME/vids";
      music = "$HOME/music";

      extraConfig = { XDG_SCREENSHOTS_DIR = "$HOME/pics/screenshots"; };

      createDirectories = true;
    };

    mimeApps = let
      list = {
        "text/html" = [ "brave.desktop" ];
        "x-scheme-handler/http" = [ "brave.desktop" ];
        "x-scheme-handler/https" = [ "brave.desktop" ];
        "x-scheme-handler/ftp" = [ "brave.desktop" ];
        "x-scheme-handler/about" = [ "brave.desktop" ];
        "x-scheme-handler/unknown" = [ "brave.desktop" ];
        "application/x-extension-htm" = [ "brave.desktop" ];
        "application/x-extension-html" = [ "brave.desktop" ];
        "application/x-extension-shtml" = [ "brave.desktop" ];
        "application/xhtml+xml" = [ "brave.desktop" ];
        "application/x-extension-xhtml" = [ "brave.desktop" ];
        "application/x-extension-xht" = [ "brave.desktop" ];
        "application/json" = [ "brave.desktop" ];
        "application/pdf" = [ "brave.desktop" ];

        "audio/*" = [ "mpv.desktop" ];
        "video/*" = [ "mpv.desktop" ];
        "image/*" = [ "feh.desktop" ];

        "application/zip" = [ "thunar.desktop" ];

        "application/x.bittorrent" = [ "qbittorrent.desktop" ];

        "x-scheme-handler/discord" = [ "discord.desktop" ];
      };
    in {
      enable = true;
      associations.added = list;
      defaultApplications = list;
    };
  };
}
