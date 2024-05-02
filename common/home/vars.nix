_: {
  home.sessionVariables = {
    # Editor managed by helix directly

    TERM = "foot";
    BROWSER = "librewolf";

    # Wayland specific
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    XDG_CURRENT_DESKTOP = "sway"; # :trol:
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";

    # GTK Theme managed in /desktop/env.nix
  };
}
