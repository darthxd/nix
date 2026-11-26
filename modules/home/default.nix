{ config, pkgs, ... }:

{

  imports = [
    ./hyprland.nix
    ./zsh.nix
  ];

  home = {
    username = "gabriel";
    homeDirectory = "/home/gabriel";

    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;

  xdg.enable = true;
}

