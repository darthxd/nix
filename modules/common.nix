{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "en_US.UTF-8";

  programs.zsh.enable = true;

  # Exemplo: mantenha a versão da instalação inicial.
  system.stateVersion = "26.05";
}