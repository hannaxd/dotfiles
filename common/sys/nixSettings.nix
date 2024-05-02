_: {
  nix = {
    setings = {
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "root" "ruby" ];
      auto-optimise-store = true;
      max-jobs = "auto";
      builders-use-substitutes = true;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      randomizedDelaySec = "10m";
      options = "--delete-older-than 3d";
    };
  };
}
