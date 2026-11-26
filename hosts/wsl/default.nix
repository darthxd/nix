{ pkgs, username, ... }:

{
  networking.hostName = "nixos-wsl";

  wsl = {
    enable = true;
    defaultUser = username;

    interop.includePath = true;
  };

  environment.systemPackages = with pkgs; [
    wget
  ];

  programs.nix-ld.enable = true;

  system.stateVersion = "26.05";
}
