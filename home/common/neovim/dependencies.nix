{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    curl
    wget
    unzip

    gcc
    gnumake
    pkg-config

    ripgrep
    fd

    nodejs
    python3

    tree-sitter
  ];
}
