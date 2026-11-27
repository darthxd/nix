{ pkgs, ... }:

{
  home.packages = with pkgs; [
    eza
    bat
    fzf
    ripgrep
    fd
    btop
    tree
    jq
    lazygit
    fastfetch
  ];
}
