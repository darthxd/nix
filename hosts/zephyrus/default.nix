{ username, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./hardware.nix
    ../../modules/nixos/desktop
  ];

  networking.hostName = "zephyrus";

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  users.users.${username}.extraGroups = [
    "video"
    "audio"
    "networkmanager"
  ];

  networking.networkmanager.enable = true;

  home-manager.users.${username} = {
    imports = [
      ../../home/desktop
    ];
  };

  system.stateVersion = "26.05";
}
