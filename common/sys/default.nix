{ ... }: {
  imports = [
    ./boot.nix
    ./compat.nix
    ./desktops.nix
    ./fonts.nix
    ./kernel.nix
    ./network.nix
    ./nixSettings.nix
    ./packages.nix
    ./security.nix
    ./services.nix
    ./sound.nix
    ./stylix.nix
    ./user.nix
  ];
}
