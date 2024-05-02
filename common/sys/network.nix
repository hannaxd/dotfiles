_: {
  networking = {
    networkmanager = { enable = true; };

    stevenblack = {
      enable = true;
      block = [ "fakenews" "gambling" ];
    };

    firewall = {
      enable = true;
      allowPing = false;
      logReversePathDrops = true;
    };
  };

  systemd.services.NetworkManager-wait-online.enable = false;
}
