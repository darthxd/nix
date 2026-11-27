{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Lua
    stylua

    # Nix
    nixfmt

    # Python
    ruff

    # JavaScript / TypeScript / HTML / CSS
    prettierd

    # Shell
    shfmt

    # C / C++
    clang-tools

    # Rust
    rustfmt

    # Go
    gofumpt

    # TOML
    taplo
  ];
}
