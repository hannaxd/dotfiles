{ pkgs, ... }: {
  home.packages = with pkgs; [ tor-browser-bundle-bin brave ];

  programs.librewolf = { enable = true; };

  programs.chromium = {
    enable = true;

    dictionaries = with pkgs; [
      hunspellDictsChromium.en_US
      hunspellDictsChromium.de_DE
    ];

    extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # UBlock Origin
      { id = "pkehgijcmpdhfbdbbnkijodmdjhbjlgp"; } # Privacy Badger
      { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } # Dark Reader
      { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # SponsorBlock YouTube
    ];
  };
}
