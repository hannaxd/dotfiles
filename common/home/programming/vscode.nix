{ pkgs, ... }: {
  programs.vscode = {
    enable = true;

    package = pkgs.vscode.fhsWithPackages
      (ps: with ps; [ rustup zlib openssl.dev pkg-config ]);

    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;

    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      rust-lang.rust-analyzer
      ziglang.vscode-zig
      pkief.material-icon-theme
      pkief.material-product-icons
      golang.go
      prisma.prisma
      astro-build.astro-vscode
      enkia.tokyo-night
      arcticicestudio.nord-visual-studio-code
      catppuccin.catppuccin-vsc
      arrterian.nix-env-selector
      svelte.svelte-vscode
      esbenp.prettier-vscode
    ];

    userSettings = {
      "editor.fontSize" = 16;
      "editor.fontFamily" = "'Monaspace Krypton', 'JetBrainsMono Nerd Font'";
      "editor.fontLigatures" =
        "'calt', 'liga', 'dlig', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08'";
      "editor.defaultFormatter" = "esbenp.prettier-vscode";

      "workbench.colorTheme" = "Tokyo Night";
      "workbench.iconTheme" = "material-icon-theme";

      "terminal.integrated.fontFamily" =
        "'CaskaydiaCove Nerd Font', 'JetBrainsMono Nerd Font', monospace";

      "explorer.confirmDragAndDrop" = false;
      "explorer.confirmDelete" = false;

      "files.autoSave" = "afterDelay";
      "files.autoSaveDelay" = 3000;

      "security.workspace.trust.untrustedFiles" = "open";

      "window.titleBarStyle" = "custom"; # Wayland Fix
    };
  };
}
