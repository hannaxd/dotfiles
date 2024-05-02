{ pkgs, ... }: {
  users.users = {
    ruby = {
      description = "Ruby";
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "audio"
        "video"
        "networkmanager"
        "power"
        "nix"
        "docker"
        "input"
      ];
      shell = pkgs.zsh;
    };
  };

  programs.zsh.enable = true;
}
