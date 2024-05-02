{ pkgs, ... }: {
  home.packages = with pkgs; [ amfora ];

  xdg.configFile = { "amfora/config.toml".source = ./config.toml; };
}
