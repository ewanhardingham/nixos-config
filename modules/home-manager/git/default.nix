{ ... }:
{
  programs.git = {
    enable = true;
    userName = "ewanhardingham";
    userEmail = "ewan.hardingham@hey.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}
