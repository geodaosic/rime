{config, pkgs, pkgs-unstable,...}:

{
  programs.bash = {
    enable = true;
    shellAliases = {
        ll = "ls -l";
        la = "ls -a";
        kms = "shutdown now";
      }
  };
}
