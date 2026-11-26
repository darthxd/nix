{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim

    # Dependências dos plugins
    git
    gcc
    gnumake
    ripgrep
    fd
    unzip
    curl
    nodejs
    lua-language-server
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/nixos/home/dotfiles/nvim";
}
