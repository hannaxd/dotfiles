{ pkgs, inputs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Desktop
    libnotify
    libsixel
    brightnessctl
    hyprpicker
    hyprpaper
    swayidle
    wl-clipboard
    wtype
    bemenu
    hyfetch # :trol:

    # environment
    xfce.thunar
    xdg-utils

    # libraries
    speechd

    # Dicts
    aspell
    aspellDicts.en-science
    aspellDicts.en
    aspellDicts.de
    aspellDicts.nb # Norwegian Bokmal
    hunspell
    hunspellDicts.en-us
    hunspellDicts.de-de
    hunspellDicts.nb-no # Norwegian Bokmal

    # cli tools
    glow
    charm-freeze
    melt
    vhs

    # workies
    libreoffice
  ];
}
