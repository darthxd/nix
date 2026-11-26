{ pkgs, ... }:

{
  users.users.gabriel = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };
}