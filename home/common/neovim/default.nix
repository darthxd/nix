{ config, pkgs, ... }:
{
  imports = [
    ./dependencies.nix
    ./lsp.nix
    ./formatters.nix
    ./linters.nix
  ];

  home.packages = [
    pkgs.neovim
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/dotfiles/nvim";
}
