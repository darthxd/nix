{ config, pkgs, ... }:

{

  imports = [
  # ./hyprland.nix
    ./zsh.nix
  ];

  home = {
    username = "gabriel";
    homeDirectory = "/home/gabriel";

    stateVersion = "26.05";
  };

  home.packages = with pkgs; [
    bat
    eza
    fzf
    zoxide
  ];

  programs.home-manager.enable = true;
}

