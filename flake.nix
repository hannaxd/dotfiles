{
  description = "A simple home-manager flake using Aux";

  inputs = {
    nixpkgs.url = "github:auxolotl/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    stylix.url = "github:danth/stylix";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { self, nixpkgs, home-manager, hyprland-contrib, aagl, nur, stylix
    , nix-vscode-extensions, rust-overlay, ... }@inputs:
    let
      system = "x86_64-linux";
      desktopWallpaper = ./assets/wallpapers/wall.png;
      desktopWallpaperVert = ./assets/wallpapers/wall-vert.png;
      inherit (nixpkgs) lib;
    in {
      nixosConfigurations = {
        "seele" = lib.nixosSystem {
          inherit system;

          specialArgs = {
            inherit inputs desktopWallpaper desktopWallpaperVert;
          };

          modules = [
            nur.hmModules.nur
            stylix.nixosModules.stylix
            ./hosts/seele/home/desktop/stylix.nix
            aagl.nixosModules.default

            ./hosts/seele/config.nix

            ({ pkgs, ... }: {
              nixpkgs.overlays = [ rust-overlay.overlays.default ];
              environment.systemPackages = with pkgs; [
                rust-bin.beta.latest.default
                gcc
              ];
            })

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = {
                  inherit inputs desktopWallpaper desktopWallpaperVert;
                };

                useGlobalPkgs = true;
                useUserPackages = true;

                backupFileExtension = "bakup";

                users.ruby = { ... }: {
                  imports = [ ./hosts/seele/home.nix ];
                  stylix.autoEnable = false;
                };
              };
            }
          ];
        };
      };
    };

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://helix.cachix.org"
      "https://hyprland.cachix.org"
      "https://ezkea.cachix.org"
    ];

    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
    ];
  };
}
