{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Python
    ruff

    # Shell
    shellcheck

    # Markdown
    markdownlint-cli2

    # YAML
    yamllint

    # Docker
    hadolint

    # Nix
    statix
    deadnix
  ];
}
