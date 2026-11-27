{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Lua
    lua-language-server

    # Nix
    nixd

    # Python
    pyright

    # JavaScript / TypeScript
    typescript-language-server

    # HTML / CSS / JSON
    vscode-langservers-extracted

    # YAML
    yaml-language-server

    # Bash
    bash-language-server

    # C / C++
    clang-tools

    # Rust
    rust-analyzer

    # Go
    gopls

    # TOML
    taplo

    # Markdown
    marksman
  ];
}
