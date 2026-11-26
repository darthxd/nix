
{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixos-hardware.nixosModules.asus-zephyrus-ga402x-nvidia
  ];

  # Firmware e microcode
  hardware.enableRedistributableFirmware = true;
  hardware.cpu.amd.updateMicrocode = true;

  # CPU
  boot.kernelParams = [
    "amd_pstate=active"
  ];

  # Aceleração gráfica
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Drivers gráficos
  services.xserver.videoDrivers = [
    "amdgpu"
    "nvidia"
  ];

  hardware.nvidia = {
    open = true;
    modesetting.enable = true;

    powerManagement = {
      enable = true;
      finegrained = true;
    };

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    };
  };

  # Gerenciamento de energia
  powerManagement.enable = true;
  services.power-profiles-daemon.enable = true;

  # Controle de hardware ASUS
  services.asusd.enable = true;

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  # Áudio
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # TRIM para SSD NVMe
  services.fstrim.enable = true;

  services.udev.extraRules = ''
  SUBSYSTEM=="drm", KERNEL=="card[0-9]*", KERNELS=="0000:65.00.0", SYMLINK+="dri/amd-igpu"
'';

}
