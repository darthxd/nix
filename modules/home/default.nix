{ config, pkgs, ... }:

{
  home = {
    username = "gabriel";
    homeDirectory = "/home/gabriel";

    stateVersion = "26.05";

    packages = with pkgs; [
      eza
      bat
      zoxide
    ];
  };

  programs.home-manager.enable = true;

  xdg.enable = true;
}

