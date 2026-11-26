{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "darthxd";
        email = "darthp87@gmail.com";
      };

      init.defaultBranch = "main";
    };
  };

  programs.gh = {
    enable = true;

    settings = {
      git_protocol = "https";
      editor = "nvim";
    };

    gitCredentialHelper.enable = true;
  };
}
