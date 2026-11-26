{ ... }:
{
  programs.zsh = {
    enable = true;

    # Autocompletar comandos
    enableCompletion = true;

    # Sugestoes baseadas no historico
    autosuggestion.enable = true;

    # Destaque de sintaxe
    syntaxHighlighting.enable = true;

    # Historico
    history = {
      size = 10000;
      save = 10000;
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
    };

    # Aliases
    shellAliases = {
      ll = "ls -lah";
      la = "ls -A";
      ".." = "cd ..";
      "..." = "cd ../..";

      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#zephyrus";
      rebuild-test = "sudo nixos-rebuild test --flake /etc/nixos#zephyrus";

      gs = "git status";
      gd = "git diff";
      gl = "git log --oneline";
    };

    initContent = ''
      setopt AUTO_CD
      setopt HIST_IGNORE_ALL_DUPS
    '';
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
