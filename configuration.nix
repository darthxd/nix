
{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./hardware/hardware.nix
    ./modules
  ];

  # Bootloader UEFI
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 5;
    };

    efi.canTouchEfiVariables = true;
  };

  # Rede
  networking = {
    hostName = "nixos-gabriel";
    networkmanager.enable = true;
    firewall.enable = true;
  };

  # Localização
  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "en_US.UTF-8";

  console.keyMap = "us";

  # Usuário
  users.users.gabriel = {
    isNormalUser = true;

    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
    ];
  };

  security.sudo.extraConfig = ''
    Defaults pwfeedback
  '';

  # Pacotes proprietários (NVIDIA)
  nixpkgs.config.allowUnfree = true;

  # Comandos modernos do Nix
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Otimização da Nix Store
  nix.settings.auto-optimise-store = true;

  # Versão original da instalação
  system.stateVersion = "26.05";
}
