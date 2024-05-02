_: {
  security = {
    rtkit.enable = true;
    polkit.enable = true;

    pam.services.swaylock.text = ''
      auth include login
    '';
  };
}
