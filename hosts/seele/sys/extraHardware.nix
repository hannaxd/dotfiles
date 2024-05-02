{ pkgs, ... }: {
  hardware = {
    enableAllFirmware = true;

    wooting.enable = true;

    opengl = {
      enable = true;
      driSupport = true;
      extraPackages = with pkgs; [ amdvlk ];
      driSupport32Bit = true;
      extraPackages32 = with pkgs.driversi686Linux; [ amdvlk ];
    };

    bluetooth.enable = true;
  };
}
