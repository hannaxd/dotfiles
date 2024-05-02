{ pkgs, inputs, ... }: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    gitFull
    neovim
    nixUnstable
    hyfetch
    bottom
    gnome.seahorse
    vulkan-tools
    btop

    # proton vpn
    protonvpn-cli
    protonvpn-gui
  ];

  programs.nix-index.enable = true;
  programs.command-not-found.enable = true;
}
