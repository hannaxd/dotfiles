{ pkgs, ... }: {
  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;

      shellAliases = {
        tarnow = "tar -acf";
        untar = "tar -xvf";
        mkd = "mkdir -pv";
        jctl = "journalctl -p 3 -xb";
      };

      # Fix foot terminal SSH
      initExtra = ''
        export TERM="xterm-256color"
      '';
    };

    carapace.enable = true;
    nix-index.enable = true;
    starship.enable = true;
    lf.enable = true;
    ripgrep.enable = true;

    eza = {
      enable = true;
      git = true;
      icons = true;
      extraOptions = [ "--group-directories-first" "--header" ];
    };

    zoxide = {
      enable = true;
      options = [ "--cmd cd" ];
    };

    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];
    };
  };

  home.packages = with pkgs; [
    jq
    fzf
    btop
    grc
    unzip
    rsync
    ffmpeg
    feh
    fd
    file
    comma
  ];
}
