{ pkgs, lib, inputs, ... }: {
  home = {
    username = "ruby";
    homeDirectory = lib.mkForce /home/ruby;
    stateVersion = "23.11";
  };

  imports = [ ./home ../../common/home ];
}
