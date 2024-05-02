_: {
  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = "Maple Mono NF:size=12";
        pad = "25x25";
      };

      colors = {
        # Transparent Catppuccin
        alpha = "0.8";

        foreground = "ccd6f4";
        background = "07070a";

        regular0 = "45475a"; # black
        regular1 = "f38ba8"; # red
        regular2 = "a6e3a1"; # green
        regular3 = "f9e2af"; # yellow
        regular4 = "89b4fa"; # blue
        regular5 = "f5c2e7"; # magenta
        regular6 = "94e2d5"; # cyan
        regular7 = "bac2de"; # white

        bright0 = "585b70"; # bright black
        bright1 = "f38ba8"; # bright red
        bright2 = "a6e3a1"; # bright green
        bright3 = "f9e2af"; # bright yellow
        bright4 = "89b4fa"; # bright blue
        bright5 = "f5c2e7"; # bright magenta
        bright6 = "94e2d5"; # bright cyan
        bright7 = "a6adc8"; # bright white
      };
    };
  };
}
