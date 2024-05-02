{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ docker-compose dive ];

  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;

    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}
