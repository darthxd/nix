{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    neovim
    vim
    wget
    curl
    ripgrep
    fd
    unzip
    htop
    tree
  ];
}