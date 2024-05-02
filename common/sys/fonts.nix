{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      unifont
      symbola
      maple-mono-NF
      (nerdfonts.override { fonts = [ "JetBrainsMono" "CascadiaCode" ]; })
      material-icons
      emacs-all-the-icons-fonts
      monaspace
    ];

    enableDefaultPackages = true;

    fontconfig = {
      defaultFonts = {
        monospace = [
          "Maple Mono NF"
          "JetBrainsMono Nerd Font"
          "Material Icon"
          "FontAwesome"
          "all-the-icons"
        ];
        sansSerif = [ "Noto Sans" "Unifont" ];
        serif = [ "Noto Sans" "Unifont" ];
        emoji = [ "Noto Color Emoji" "Symbola" "all-the-icons" ];
      };
    };
  };
}
