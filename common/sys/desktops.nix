{ pkgs, ... }: {
  services.xserver = {
    enable = true;
    videoDrivers = [ amdgpu ];
    displayManager.gdm.enable = true;
  };
}
