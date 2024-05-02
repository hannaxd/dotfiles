{ pkgs, ... }: {
  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    userName = "Ruby";
    userEmail = "git@nixfemby.net";

    delta.enable = true;
    lfs.enable = true;

    extraConfig = {
      init.defaultBranch = "mommy";
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
  };
}
