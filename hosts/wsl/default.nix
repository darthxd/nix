{ username, ... }:

{
  networking.hostName = "nixos-wsl";

  wsl = {
    enable = true;
    defaultUser = username;

    interop.includePath = true;
  };

  system.stateVersion = "26.05";
}
