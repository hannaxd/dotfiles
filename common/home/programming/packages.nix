{ pkgs, ... }: {
  home.packages = with pkgs; [
    tree-sitter

    nil
    statix
    nixfmt
  ];
}
