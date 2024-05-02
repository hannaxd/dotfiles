{ pkgs, ... }: {
  programs = {
    ncmpcpp.enable = true;
    mpv.enable = true;
  };

  home.packages = with pkgs; [
    pamixer
    pavucontrol
    playerctl
    vlc
    ani-cli
    qbittorrent

    # music uwu
    tidal-hifi
  ];
}
