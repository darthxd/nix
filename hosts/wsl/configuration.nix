{ config, pkgs, ... }:

{
  imports = [
    ../../modules/common.nix
    ../../modules/packages.nix
    ../../modules/users.nix
  ];

  wsl = {
    enable = true;
    defaultUser = "gabriel";

    interop.includePath = true;

    wslConf.automount.root = "/mnt";
  };

  networking.hostName = "nixos-wsl";

  # Opcional: integração com Docker Desktop.
  # wsl.docker-desktop.enable = true;
}