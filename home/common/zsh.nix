{
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      bindkey '^F' autosuggest-accept
      bindkey '^H' backward-kill-word
    '';

    shellAliases = {
      ll = "eza -lah";
      ls = "eza";
      cat = "bat";
      ".." = "z ..";
      home = "z ~";
      reload = "exec $SHELL";

    };

    history = {
      size = 10000;
      save = 10000;
      ignoreDups = true;
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
}
