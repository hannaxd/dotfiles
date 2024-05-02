{ pkgs, ... }: {
  services = {
    udiskie = {
      enable = true;
      automount = true;
    };

    gpg-agent = {
      enable = true;
      enableZshIntegration = true;
      pinentryPackage = pkgs.pinentry-gnome3;
    };

    mpris-proxy.enable = true;
  };
}
