{ pkgs, inputs, ... }: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    gitFull
    neovim
    nixUnstable
    hyfetch
    bottom
    # gnome.seahorse <- noved to using option
    vulkan-tools
    btop

    wootility # <- see extraHardware
  ];

  programs = {
    nix-index.enable = true;
    command-not-found.enable = false;
    seahorse.enable = true;
    openvpn3.enable = true;
  };
}
