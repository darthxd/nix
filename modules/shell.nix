{ pkgs, ... }:

{
  programs.zsh.enable = true;

  users.users.gabriel.shell = pkgs.zsh;

}

