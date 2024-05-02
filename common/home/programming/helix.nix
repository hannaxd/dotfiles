_: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "catppuccin_mocha";

      editor = {
        lsp = {
          enable = true;
          display-messages = true;
          display-inlay-hints = true;
          snippets = true;
        };

        auto-completion = true;
        auto-format = true;
        completion-replace = true;

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        mouse = true;
        indent-guides.render = true;
        cursorline = true;
        color-modes = true;
        line-number = "relative";
        bufferline = "multiple";
        true-color = true;

        shell = [ "zsh" "-c" ];

        statusline = { center = [ "version-control" ]; };
      };

      keys.normal = {
        space.space = "file_picker";
        esc = [ "collapse_selection" "keep_primary_selection" ];
      };
    };
  };
}
