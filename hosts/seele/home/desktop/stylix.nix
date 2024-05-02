{ config, pkgs, desktopWallpaper, ... }: {
  stylix = {
    image = desktopWallpaper;
    polarity = "dark";

    fonts = {
      serif = {
        name = "DejaVu Serif";
        package = pkgs.dejavu_fonts;
      };

      sansSerif = {
        name = "DejaVu Sans";
        package = pkgs.dejavu_fonts;
      };

      monospace = {
        name = "Maple Mono NF";
        package = pkgs.maple-mono-NF;
      };

      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-emoji;
      };

      sizes = {
        desktop = 12;
        applications = 12;
        terminal = 12;
        popups = 12;
      };
    };

    opacity.terminal = 0.8;
  };
}
